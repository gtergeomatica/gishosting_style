#!/bin/bash
# Gter copyleft
# Author: Roberto Marzocchi


# the script works on a linux home where you have both lizmap and gishosting_style repositories cloned from github

#echo "Scarico la versione di lizmap " 
VERSION=3.3git
# Archive recovery with wget
#wget https://github.com/3liz/lizmap-web-client/archive/$VERSION.zip



echo "Update default JS"

cd $HOME/lizmap-web-client-$VERSION/
cd $HOME/lizmap-web-client-$VERSION/lizmap/www/themes/default/js/
mkdir bkp_style

mv switcher-layers-actions.js bkp_style/
cp $HOME/gishosting_style/js/* $HOME/lizmap-web-client-$VERSION/lizmap/www/js/



echo "Update default CSS and images"
cd $HOME/lizmap-web-client-$VERSION/

cd $HOME/lizmap-web-client-$VERSION/lizmap/www/themes/default/css/
mkdir bkp_style

mv img bkp_style/
mv images bkp_style/
mv *.css bkp_style/


cd $HOME


cp -r $HOME/gishosting_style/themes_default_css/* $HOME/lizmap-web-client-$VERSION/lizmap/www/themes/default/css/

# other css 
echo "Update map.css and bootstrap.css"
mv $HOME/lizmap-web-client-$VERSION/lizmap/www/css/map.css  $HOME/lizmap-web-client-$VERSION/lizmap/www/css/bkp_map.css 
mv $HOME/lizmap-web-client-$VERSION/lizmap/www/css/bootstrap.css $HOME/lizmap-web-client-$VERSION/lizmap/www/css/bkp_bootstrap.css 

cp $HOME/gishosting_style/css/* $HOME/lizmap-web-client-$VERSION/lizmap/www/css/



#home
mv $HOME/lizmap-web-client-$VERSION/lizmap/modules/view/controllers/lizMap.classic.php $HOME/lizmap-web-client-$VERSION/lizmap/modules/view/controllers/bkp_lizMap.classic.php
cp $HOME/gishosting_style/modules/* $HOME/lizmap-web-client-$VERSION/lizmap/modules/view/controllers/
