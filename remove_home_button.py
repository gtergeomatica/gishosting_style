#! usr/bin/env python
# script to remove home button from project
import os,sys
from sys import argv
import shutil

print("Python script to remove home button from Lizmap projects")
# assegno l'input dello script in maniera semplice
script, file = argv


shutil.move(file,'{}.bkp'.format(file))

f = open('{}.bkp'.format(file))

output = open(file, 'w')

for line in f:
    if line.find('jEvent::notify(\'LizLogItem\', $eventParams);') > -1:
        newline = line.replace('jEvent::notify(\'LizLogItem\', $eventParams);', 'jEvent::notify(\'LizLogItem\', $eventParams);\n        $rep->addStyle(\'#mapmenu li.home\',\'display:none;\'); ')
        print(newline)
        output.write(newline)
    elif  line.find('$rep->addStyle(\'#mapmenu li.home\',\'display:none;\');') > -1:
        print('Non riscrivo la linea')
    else:
        output.write(line)
