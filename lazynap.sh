
#!/bin/bash
#A BASH Script for Nmap
#Developed By 5hu8h4m
#Visit:http://fukreyhackers.in
echo "------------------------------------------------------------"
echo ""
echo "██╗      █████╗ ███████╗██╗   ██╗███╗   ██╗ █████╗ ██████╗"
echo "██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝████╗  ██║██╔══██╗██╔══██╗"
echo "██║     ███████║  ███╔╝  ╚████╔╝ ██╔██╗ ██║███████║██████╔╝"
echo "██║     ██╔══██║ ███╔╝    ╚██╔╝  ██║╚██╗██║██╔══██║██╔═══╝ "
echo "███████╗██║  ██║███████╗   ██║   ██║ ╚████║██║  ██║██║ "
echo "╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝   ╚═╝  ╚═══╝╚═╝  ╚═╝╚═╝ "
echo "    "
echo "                A BASH Script for Nmap                    "
echo "                 Developed By 5hu8h4m                     "
echo "            Visit:http://fukreyhackers.in                 "
echo ""
echo "-----------------------------------------------------------"
read -p "Enter Target IP/Domain (Single IP/Domain, Range of IP):" ip;
if [ $(dpkg-query -W -f='${Status}' nmap 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
  sudo apt-get install nmap;
fi
while true; do
echo "1.Normal Scan"
echo "2.Aggresstive Scan"
echo "3.Fast Scan"
echo "4.Include All ports"
echo "5.Detect Version"
echo "6.Detect OS"
echo "7.Open Ports Only"
echo "8.FTP Brute-Force"
echo "9.Http-Enumeration"
echo "10.SMB Brute-Force"

 read -p " Choose Option:" option
 case $option in
	1) nmap -Pn $ip | grep -v nmap
		;;
	2) nmap -A $ip | grep -v nmap
		;;
	3) nmap -F $ip | grep -v nmap
    ;;
  4) nmap -p- $ip | grep -v nmap
    ;;
  5) nmap -sV $ip | grep -v nmap
    ;;
  6) nmap -O $ip | grep -v nmap
    ;;
  7) nmap -open $ip | grep -v nmap
    ;;
  8) nmap -p 21 --script ftp-brute.nse $ip | grep -v nmap
    ;;
  9) nmap --script http-enum $ip | grep -v nmap
    ;;
  10) nmap -sV -p 445 --script smb-brute $ip | grep -v nmap
    ;;
	"q") echo "Phir Milenge :)"
		break
		;;
 esac
done
