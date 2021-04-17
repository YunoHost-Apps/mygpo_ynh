#!/bin/bash

#=================================================
# COMMON VARIABLES
#=================================================
# dependencies used by the app
pkg_dependencies="acl python3 python3-pip python3-venv postgresql postgresql-contrib libpq-dev redis-server libldap2-dev libsasl2-dev"

#=================================================
# PERSONAL HELPERS
#=================================================

function set_permissions {
	mkdir -p $data_path

	env_path=$final_path/envs/prod
	mkdir -p $env_path

	chown -R $app:$app $data_path
	chmod o-rwx $data_path
	setfacl -n -R -m u:www-data:rx -m d:u:www-data:rx $data_path

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
		sudo -u $app python3 -m venv $final_path/venv
		sudo -u $app $final_path/venv/bin/pip --cache-dir $final_path/.cache/pip install -U wheel pip --cache-dir $final_path/.cache/pip setuptools
		sudo -u $app $final_path/venv/bin/pip --cache-dir $final_path/.cache/pip install -U --requirement $final_path/requirements.txt
		sudo -u $app $final_path/venv/bin/pip --cache-dir $final_path/.cache/pip install -U --requirement $final_path/requirements-setup.txt
		sudo -u $app $final_path/venv/bin/pip --cache-dir $final_path/.cache/pip install -U --requirement $final_path/requirements-ynh.txt
		set_permissions
	popd || ynh_dies
}

function initialize_db {
	pushd $final_path || ynh_die
		chown -R $app:$app $final_path
		perform_db_migrations
		sudo -u $app $final_path/venv/bin/envdir $env_path $final_path/venv/bin/python $final_path/manage.py createsuperuser --username "$admin" --email "$admin_email" --noinput -v 0
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
	sudo -u $app $final_path/venv/bin/envdir $env_path $final_path/venv/bin/python $final_path/manage.py makemigrations
	sudo -u $app $final_path/venv/bin/envdir $env_path $final_path/venv/bin/python $final_path/manage.py migrate
}

#=================================================
# EXPERIMENTAL HELPERS
#=================================================

#=================================================
# FUTURE OFFICIAL HELPERS
#=================================================
