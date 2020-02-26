#!/bin/bash
# Gter copyleft
# Author: Roberto Marzocchi


# the script works on a linux home where you have both lizmap and gishosting_style repositories cloned from github

#echo "Scarico la versione di lizmap " 
VERSION=3.3git
# Archive recovery with wget
#wget https://github.com/3liz/lizmap-web-client/archive/$VERSION.zip

BASEDIR=$(pwd)


echo "Update default JS"



cat add_css/default_map.css >> $HOME/lizmap-web-client-$VERSION/lizmap/www/themes/default/css/map.css

cat add_css/add_bootstrap.css >> $HOME/lizmap-web-client-$VERSION/lizmap/www/css/bootstrap.css





cd $HOME/lizmap-web-client-$VERSION/
cd $HOME/lizmap-web-client-$VERSION/lizmap/www/themes/default/js/
mkdir bkp_style

mv switcher-layers-actions.js bkp_style/
cp $HOME/gishosting_style/js/* $HOME/lizmap-web-client-$VERSION/lizmap/www/js/



echo "Update default images"
cd $HOME/lizmap-web-client-$VERSION/

cd $HOME/lizmap-web-client-$VERSION/lizmap/www/themes/default/css/
mkdir bkp_style

mv img bkp_style/
#mv images bkp_style/
#mv *.css bkp_style/

cp -f $HOME/gishosting_style/themes_default_css/img/* $HOME/lizmap-web-client-$VERSION/lizmap/www/themes/default/css/img/

mv $HOME/lizmap-web-client-$VERSION/lizmap/www/themes/default/css/img/logo_footer.png $HOME/lizmap-web-client-$VERSION/lizmap/www/themes/default/css/img/logo_footer-old.png

cp $HOME/lizmap-web-client-$VERSION/lizmap/www/themes/default/css/img/logo_footer-gter.png $HOME/lizmap-web-client-$VERSION/lizmap/www/themes/default/css/img/logo_footer.png 

cd $HOME


STRING_TO_REPLACE="jEvent::notify('LizLogItem', $eventParams);"
STRING_NEW="jEvent::notify('LizLogItem', $eventParams);
$rep->addStyle('#mapmenu li.home','display:none;');"

echo "***********************************"
echo "Remember to change this line "
echo $STRING_TO_REPLACE
echo -e "\n with \n"
echo -e $STRING_NEW
echo ' in the file lizmap/modules/view/controllers/lizMap.classic.php'
echo "***********************************\n\n"
#cd $HOME/lizmap-web-client-$VERSION/lizmap/modules/view/controllers

cd $BASEDIR

/usr/bin/python3 remove_home_button.py $HOME/lizmap-web-client-$VERSION/lizmap/modules/view/controllers/lizMap.classic.php
#sed -r -i.bak s/jEvent::notify('LizLogItem', $eventParams);/jEvent::notify('LizLogItem', $eventParams); \n $rep->addStyle('#mapmenu li.home','display:none;');]/g lizMap.classic.php





#jEvent::notify('LizLogItem', $eventParams);

#// add by GTER
#$rep->addStyle('#mapmenu li.home','display:none;');


# other css 
#echo "Update map.css and bootstrap.css"
#mv $HOME/lizmap-web-client-$VERSION/lizmap/www/css/map.css  $HOME/lizmap-web-client-$VERSION/lizmap/www/css/bkp_map.css 
#mv $HOME/lizmap-web-client-$VERSION/lizmap/www/css/bootstrap.css $HOME/lizmap-web-client-$VERSION/lizmap/www/css/bkp_bootstrap.css 

#cp $HOME/gishosting_style/css/* $HOME/lizmap-web-client-$VERSION/lizmap/www/css/



#home
#mv $HOME/lizmap-web-client-$VERSION/lizmap/modules/view/controllers/lizMap.classic.php $HOME/lizmap-web-client-$VERSION/lizmap/modules/view/controllers/bkp_lizMap.classic.php
#cp $HOME/gishosting_style/modules/* $HOME/lizmap-web-client-$VERSION/lizmap/modules/view/controllers/