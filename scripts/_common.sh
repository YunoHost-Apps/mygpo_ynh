#!/bin/bash

#=================================================
# COMMON VARIABLES
#=================================================

env_path="$install_dir/envs/prod"

#=================================================
# PERSONAL HELPERS
#=================================================

function set_permissions {
	chmod 750 "$data_dir"
	chown -R "$app:$app" "$data_dir"
	setfacl -n -R -m u:www-data:rx -m d:u:www-data:rx "$data_dir"

	chmod 750 "$install_dir"
	chown -R "$app:$app" "$install_dir"
	setfacl -n -R -m user:www-data:rx -m default:user:www-data:rx "$install_dir"
	setfacl -n -R -m user:www-data:- -m default:user:www-data:- "$install_dir/envs"
}

function set_up_virtualenv {
	mkdir -p "$env_path"
	ynh_add_config --template="requirements-ynh.txt" --destination="$install_dir/requirements-ynh.txt"

	ynh_exec_warn_less ynh_exec_as "$app" python3 -m venv "$install_dir/venv"
	ynh_exec_warn_less ynh_exec_as "$app" "$install_dir/venv/bin/pip" --cache-dir "$install_dir/.cache/pip" install -U wheel pip --cache-dir "$install_dir/.cache/pip" setuptools
	ynh_exec_warn_less ynh_exec_as "$app" "$install_dir/venv/bin/pip" --cache-dir "$install_dir/.cache/pip" install -U --requirement "$install_dir/sources/requirements.txt"
	ynh_exec_warn_less ynh_exec_as "$app" "$install_dir/venv/bin/pip" --cache-dir "$install_dir/.cache/pip" install -U --requirement "$install_dir/sources/requirements-setup.txt"
	ynh_exec_warn_less ynh_exec_as "$app" "$install_dir/venv/bin/pip" --cache-dir "$install_dir/.cache/pip" install -U --requirement "$install_dir/requirements-ynh.txt"
}

function collect_static {
	pushd "$install_dir"
		chown -R "$app:$app" "$install_dir"
		ynh_exec_warn_less ynh_exec_as "$app" "$install_dir/venv/bin/envdir" "$env_path" "$install_dir/venv/bin/python" "$install_dir/sources/manage.py" collectstatic --noinput
	popd
}

function initialize_db {
	perform_db_migrations
	ynh_exec_warn_less ynh_exec_as "$app" "$install_dir/venv/bin/envdir" "$env_path" "$install_dir/venv/bin/python" "$install_dir/sources/manage.py" createsuperuser --username "$admin" --email "$admin_email" --noinput -v 0
}

function upgrade_db {
	perform_db_migrations
}

function perform_db_migrations {
	yes | ynh_exec_warn_less ynh_exec_as "$app" "$install_dir/venv/bin/envdir" "$env_path" "$install_dir/venv/bin/python" "$install_dir/sources/manage.py" makemigrations --merge
	ynh_exec_warn_less ynh_exec_as "$app" "$install_dir/venv/bin/envdir" "$env_path" "$install_dir/venv/bin/python" "$install_dir/sources/manage.py" migrate
}

#=================================================
# EXPERIMENTAL HELPERS
#=================================================

#=================================================
# FUTURE OFFICIAL HELPERS
#=================================================
