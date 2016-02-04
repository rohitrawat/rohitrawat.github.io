if [ $# -ne 2 ]
then
	exit;
fi
rm skyshot000.png
cat in.ssc | sed -e "s/LAT/$1/" | sed -e "s/LON/$2/" > final.ssc
cat final.ssc
stellarium --screenshot-dir "$PWD" --startup-script "$PWD/final.ssc" &
sleep 4
pkill stellarium

