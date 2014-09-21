#!/bin/sh
#
# This script will load into the fig-linked mariadb the SQL scripts located into /sql-load/

if [ -z "$APP_DB_1_PORT_3306_TCP_ADDR" ]; then
	echo "No MariaDb host found. I expect to find the environment variable $APP_DB_1_PORT_3306_TCP_ADDR to not be empty."
	exit 1
fi
if [ -z "$APP_DB_1_ENV_MARIADB_PASS" ]; then
	echo "No password found for db user named 'admin'. I expect to find the environment variable $APP_DB_1_ENV_MARIADB_PASS to not be empty."
	exit 1
fi

for SQLSCRIPT in /sqls/*.sql; do 
	echo "== Loading $SQLSCRIPT into database :"
	mysql -uadmin -p$APP_DB_1_ENV_MARIADB_PASS -h$APP_DB_1_PORT_3306_TCP_ADDR -P3306 < "$SQLSCRIPT"
	echo "== End of $SQLSCRIPT loading."
done
