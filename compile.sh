#!/bin/bash

find ./ -type f -exec chmod 777 {} \;
make clean && make do FINALPACKAGE=1;