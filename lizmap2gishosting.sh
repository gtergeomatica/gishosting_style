#!/bin/bash
# Gter copyleft
# Author: Roberto Marzocchi


# the script works on a linux home where you have both lizmap and gishosting_style repositories cloed from github

#echo "Scarico la versione di lizmap " 
VERSION=3.1.16
# Archive recovery with wget
#wget https://github.com/3liz/lizmap-web-client/archive/$VERSION.zip



cd $HOME/lizmap-web-client-$VERSION/

cd lizmap/www/themes/default/css/

mkdir bkp_style
mv -r * bkp_style/

cd $HOME


cp $HOME/gishosting_style/themes_default_css/* $HOME/lizmap-web-client-$VERSION/lizmap/www/themes/default/css/

# other css 

mv $HOME/lizmap-web-client-$VERSION/lizmap/www/css/map.css mv $HOME/lizmap-web-client-$VERSION/lizmap/www/css/bkp_map.css 
mv $HOME/lizmap-web-client-$VERSION/lizmap/www/css/bootstrap.css mv $HOME/lizmap-web-client-$VERSION/lizmap/www/css/bkp_bootstrap.css 

cp $HOME/gishosting_style/css/* $HOME/lizmap-web-client-$VERSION/lizmap/www/css/



#home
mv $HOME/lizmap-web-client-$VERSION/lizmap/modules/view/controllers/lizMap.classic.php $HOME/lizmap-web-client-$VERSION/lizmap/modules/view/controllers/bkp_lizMap.classic.php
cp $HOME/gishosting_style/modules/* $HOME/lizmap-web-client-$VERSION/lizmap/modules/view/controllers/