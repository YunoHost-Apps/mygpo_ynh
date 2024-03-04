#!/bin/bash

#=================================================
# COMMON VARIABLES
#=================================================

#=================================================
# PERSONAL HELPERS
#=================================================

function set_permissions {
	mkdir -p $data_dir

	env_path=$install_dir/envs/prod
	mkdir -p $env_path

	chown -R $app:$app $data_dir
	chmod o-rwx $data_dir
	setfacl -n -R -m u:www-data:rx -m d:u:www-data:rx $data_dir

	chown -R root:$app $install_dir
	chmod -R g=u,g-w,o-rwx $install_dir
	setfacl -n -R -m user:www-data:rx -m default:user:www-data:rx $install_dir
	setfacl -n -R -m user:www-data:- -m default:user:www-data:- $install_dir/envs
}

function set_up_virtualenv {
	env_path=$install_dir/envs/prod
	mkdir -p $env_path
	ynh_add_config --template="requirements-ynh.txt" --destination="$install_dir/requirements-ynh.txt"

	pushd $install_dir || ynh_die
		chown -R $app:$app $install_dir
		ynh_exec_warn_less ynh_exec_as $app python3 -m venv $install_dir/venv
		ynh_exec_warn_less ynh_exec_as $app $install_dir/venv/bin/pip --cache-dir $install_dir/.cache/pip install -U wheel pip --cache-dir $install_dir/.cache/pip setuptools
		ynh_exec_warn_less ynh_exec_as $app $install_dir/venv/bin/pip --cache-dir $install_dir/.cache/pip install -U --requirement $install_dir/requirements.txt
		ynh_exec_warn_less ynh_exec_as $app $install_dir/venv/bin/pip --cache-dir $install_dir/.cache/pip install -U --requirement $install_dir/requirements-setup.txt
		ynh_exec_warn_less ynh_exec_as $app $install_dir/venv/bin/pip --cache-dir $install_dir/.cache/pip install -U --requirement $install_dir/requirements-ynh.txt
		set_permissions
	popd || ynh_dies
}

function initialize_db {
	pushd $install_dir || ynh_die
		chown -R $app:$app $install_dir
		perform_db_migrations
		ynh_exec_warn_less ynh_exec_as $app $install_dir/venv/bin/envdir $env_path $install_dir/venv/bin/python $install_dir/manage.py createsuperuser --username "$admin" --email "$admin_email" --noinput -v 0
		set_permissions
	popd || ynh_die
}

function upgrade_db {
	pushd $install_dir || ynh_die
		chown -R $app:$app $install_dir
		perform_db_migrations
		set_permissions
	popd || ynh_die
}

function perform_db_migrations {
	echo "y" | ynh_exec_warn_less ynh_exec_as $app $install_dir/venv/bin/envdir $env_path $install_dir/venv/bin/python $install_dir/manage.py makemigrations --merge
	ynh_exec_warn_less ynh_exec_as $app $install_dir/venv/bin/envdir $env_path $install_dir/venv/bin/python $install_dir/manage.py migrate
}

#=================================================
# EXPERIMENTAL HELPERS
#=================================================

#=================================================
# FUTURE OFFICIAL HELPERS
#=================================================
