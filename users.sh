# First update the authorized_users.txt file with the authorized users


eval getent passwd {$(awk '/^UID_MIN/ {print $2}' /etc/login.defs)..$(awk '/^UID_MAX/ {print $2}' /etc/login.defs)} | cut -d: -f1 >> users.test 
cat authorized_users.txt users.txt >> merged.txt
cat merged.txt | sort | uniq -u