#!/bin/bash

#=================================================
# COMMON VARIABLES
#=================================================

# dependencies used by the app
pkg_dependencies="acl python3 python3-dev python3-pip python3-venv postgresql postgresql-contrib libpq-dev redis-server libldap2-dev libsasl2-dev"

#=================================================
# PERSONAL HELPERS
#=================================================

function set_permissions {
	mkdir -p $datadir

	env_path=$final_path/envs/prod
	mkdir -p $env_path

	chown -R $app:$app $datadir
	chmod o-rwx $datadir
	setfacl -n -R -m u:www-data:rx -m d:u:www-data:rx $datadir

	chown -R root:$app $final_path
	chmod -R g=u,g-w,o-rwx $final_path
	setfacl -n -R -m user:www-data:rx -m default:user:www-data:rx $final_path
	setfacl -n -R -m user:www-data:- -m default:user:www-data:- $final_path/envs
}

function set_up_virtualenv {
	env_path=$final_path/envs/prod
	mkdir -p $env_path

	pushd $final_path || ynh_die
		chown -R $app:$app $final_path
		ynh_exec_warn_less ynh_exec_as $app python3 -m venv $final_path/venv
		ynh_exec_warn_less ynh_exec_as $app $final_path/venv/bin/pip --cache-dir $final_path/.cache/pip install -U wheel pip --cache-dir $final_path/.cache/pip setuptools
		ynh_exec_warn_less ynh_exec_as $app $final_path/venv/bin/pip --cache-dir $final_path/.cache/pip install -U --requirement $final_path/requirements.txt
		ynh_exec_warn_less ynh_exec_as $app $final_path/venv/bin/pip --cache-dir $final_path/.cache/pip install -U --requirement $final_path/requirements-setup.txt
		ynh_exec_warn_less ynh_exec_as $app $final_path/venv/bin/pip --cache-dir $final_path/.cache/pip install -U --requirement $final_path/requirements-ynh.txt
		set_permissions
	popd || ynh_dies
}

function initialize_db {
	pushd $final_path || ynh_die
		chown -R $app:$app $final_path
		perform_db_migrations
		ynh_exec_warn_less ynh_exec_as $app $final_path/venv/bin/envdir $env_path $final_path/venv/bin/python $final_path/manage.py createsuperuser --username "$admin" --email "$admin_email" --noinput -v 0
		set_permissions
	popd || ynh_die
}

function upgrade_db {
	pushd $final_path || ynh_die
		chown -R $app:$app $final_path
		perform_db_migrations
		set_permissions
	popd || ynh_die
}

function perform_db_migrations {
	echo "y" | ynh_exec_warn_less ynh_exec_as $app $final_path/venv/bin/envdir $env_path $final_path/venv/bin/python $final_path/manage.py makemigrations --merge
	ynh_exec_warn_less ynh_exec_as $app $final_path/venv/bin/envdir $env_path $final_path/venv/bin/python $final_path/manage.py migrate
}

function get_app_settings {
	domain=$(ynh_app_setting_get --app=$app --key=domain)
	path_url=$(ynh_app_setting_get --app=$app --key=path)
	final_path=$(ynh_app_setting_get --app=$app --key=final_path)
	datadir=$(ynh_app_setting_get --app=$app --key=datadir)
	admin=$(ynh_app_setting_get --app=$app --key=admin)
	secret_key=$(ynh_app_setting_get --app=$app --key=secret_key)
	admin_email=$(ynh_user_get_info --username=$admin --key="mail")
	db_name=$(ynh_app_setting_get --app=$app --key=db_name)
	db_user="$db_name"
	db_pwd=$(ynh_app_setting_get --app=$app --key=psqlpwd)
}

#=================================================
# EXPERIMENTAL HELPERS
#=================================================

#=================================================
# FUTURE OFFICIAL HELPERS
#=================================================
