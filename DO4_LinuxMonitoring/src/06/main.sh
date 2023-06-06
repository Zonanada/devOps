#!/bin/bash
sudo apt install goaccess
sudo goaccess ../04/log1.log -o log1.html --log-format=COMBINED
sudo goaccess ../04/log2.log -o log2.html --log-format=COMBINED
sudo goaccess ../04/log3.log -o log3.html --log-format=COMBINED
sudo goaccess ../04/log4.log -o log4.html --log-format=COMBINED