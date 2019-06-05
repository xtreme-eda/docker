#!/bin/bash
#
#  Copyright (c) 2014-2016 Mentor Graphics Corporation All Rights Reserved
#  ______________________________________________________________________
#
#
if [ "$1" != "-silent" ]; then
	echo " "
	echo "WARNING: If the Mentor Graphics Installer is uninstalled,"
	echo "you will not be able to uninstall any Mentor Graphics product(s)."
	echo " "
	echo "Do you really want to uninstall Mentor Graphics Installer? (yes/no)"
	read OK2REMOVE

	if [ "$OK2REMOVE" != "yes" ]; then
		echo "Uninstall aborted."
		exit 0
	fi
fi

# Get full path to uninstall.sh (should be in bin)
pushd `dirname $0` > /dev/null
MIPPATH=`pwd -P`
popd > /dev/null
# Get path up one directory (should be install.VCO)
MIPPATH=`dirname $MIPPATH`


if [ ! -f ${MIPPATH}/.uninstallmanifest ]; then
	echo "Could not find manifest file. Exiting."
	exit 1
fi
echo "Uninstalling $MIPPATH"

cd ${MIPPATH}/..

# First remove some static files that might keep directories from being removed
rm ${MIPPATH}/bin/.mgc  > /dev/null 2>&1
rm ${MIPPATH}/data/userData.xml.gz  > /dev/null 2>&1
rm ${MIPPATH}/java/MIPresource.properties  > /dev/null 2>&1
rm ${MIPPATH}/JRE/version.txt  > /dev/null 2>&1
rm ${MIPPATH}/legal/eula.txt  > /dev/null 2>&1
rm ${MIPPATH}/legal/eula_jp.txt  > /dev/null 2>&1

# Now remove all the files that were recorded in the manifest
while read filename; do

	if [ -d $filename ]; then
		rmdir $filename  > /dev/null 2>&1
	else 
		rm $filename  > /dev/null 2>&1
	fi

done < ${MIPPATH}/.uninstallmanifest

# Now we remove the rest of the static files, and directories

rm ${MIPPATH}/install > /dev/null 2>&1
rm ${MIPPATH}/mip_history.txt > /dev/null 2>&1
rm ${MIPPATH}/.uninstallmanifest > /dev/null 2>&1
rm -rf ${MIPPATH}/data > /dev/null 2>&1
rm -rf ${MIPPATH}/LOGS > /dev/null 2>&1
rm -rf ${MIPPATH}/tmp > /dev/null 2>&1

# Now we delete ourself
echo "#!/bin/bash" > /var/tmp/uninstall.sh
echo "sleep 2" >> /var/tmp/uninstall.sh
echo "rm ${MIPPATH}/bin/uninstall.sh > /dev/null 2>&1" >> /var/tmp/uninstall.sh
echo "rmdir ${MIPPATH}/java > /dev/null 2>&1" >> /var/tmp/uninstall.sh
echo "rmdir ${MIPPATH}/bin > /dev/null 2>&1" >> /var/tmp/uninstall.sh
echo "rmdir ${MIPPATH} > /dev/null 2>&1" >> /var/tmp/uninstall.sh
echo "rm /var/tmp/uninstall.sh > /dev/null 2>&1" >> /var/tmp/uninstall.sh
chmod 775 /var/tmp/uninstall.sh
/var/tmp/uninstall.sh &

