echo "Enter 0 to enter New employee details / ID to search"
read z
w=$(awk '{print $3}' emp.log)
if [ $z -gt 0 ]
then
	for i in $w
	do
		if [ $i -eq $z ]
		then
			awk -v var="$z" '($3 == var)' emp.log
			exit
		fi
	done
	echo "Not found"
else
a="y"
until [ "$a" = "n" ] || [ "$a" = "N" ]
do
	echo "Enter Your Name"
	read name
	echo "Enter Your ID"
	read id
	echo "Enter Your Designation"
	read desi
	echo "Enter your Phone Number"
	read phone
        echo "Enter your Basic Pay"
        read basic
        echo "Enter your hra"
        read hra
        echo "Enter your da"
        read da
        echo "Enter your ta"
        read ta
	echo "Do you want to save[y/n]"
	read x
	if [ "$x" = "y" ] || [ "$x" = "Y" ]
	then
		gpay=`expr $basic + $hra + $da + $ta`
		pf=`expr 12 \* $basic / 100`
		npay=`expr $gpay - $pf`
            	echo $name \| $id \| $desi \| $phone \| $basic \| $hra \| $da \| $ta \| $gpay \| $npay\| $pf >> /home/ashwinpreethn/Documents/QuESTGlobalTraining/Shell/emp.log
	else
		continue
	fi
	echo "Do you Want to Enter [y/n]"
	read a
done
fi
