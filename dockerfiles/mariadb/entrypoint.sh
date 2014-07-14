#!/bin/bash

VOLUMEDATA=${MARIADB_DATA:-"/DATA/db"}
PASS=${MARIADB_PASS:-$(pwgen -s 12 1)}
USERNAME=${MARIADB_USER:-mysql}
MYSQL_BINS="/usr/bin"

create_mariadb_admin_user() {
	${MYSQL_BINS}/mysqld_safe > /dev/null 2>&1 &

	RET=1
	while [[ RET -ne 0 ]]; do
	    echo "=> Waiting for confirmation of MariaDB service startup"
	    sleep 5
	    ${MYSQL_BINS}/mysql -uroot -e "status" > /dev/null 2>&1
	    RET=$?
	done


	
	_word=$( [ ${MARIADB_PASS} ] && echo "preset" || echo "random" )
	echo "=> Creating MariaDB admin user with ${_word} password"

	${MYSQL_BINS}/mysql -uroot -e "CREATE USER 'admin'@'%' IDENTIFIED BY '$PASS'"
	${MYSQL_BINS}/mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' WITH GRANT OPTION"

	echo "=> Done!"

	echo "========================================================================"
	echo "You can now connect to this MariaDB Server using:"
	echo ""
	echo "    mysql -uadmin -p$PASS -h<host> -P<port>"
	echo ""
	echo "Please remember to change the above password as soon as possible!"
	echo "MariaDB user 'root' has no password but only allows local connections"
	echo "========================================================================"

	${MYSQL_BINS}/mysqladmin -uroot shutdown
}

# Set user to run daemon with
sed -i "s#{{USERNAME}}#$USERNAME#g" /etc/my.cnf
sed -i "s#{{VOLUMEDATA}}#$VOLUMEDATA#g" /etc/my.cnf

echo "========================================================================"
echo "Content of /etc/my.cnf :"
cat /etc/my.cnf
echo "========================================================================"

if [[ ! -d "$VOLUMEDATA/mysql" ]]; then
    echo "=> An empty or uninitialized MariaDB volume is detected in $VOLUMEDATA"
    echo "=> Installing MariaDB ..."
    ${MYSQL_BINS}/mysql_install_db --datadir=$VOLUMEDATA --user=$USERNAME > /dev/null 2>&1
    echo "=> Done!"  
    create_mariadb_admin_user
else
    echo "=> Using an existing volume of MariaDB"
fi



exec ${MYSQL_BINS}/mysqld_safe