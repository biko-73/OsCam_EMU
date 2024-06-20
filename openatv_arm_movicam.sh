#!/bin/sh
echo 'Bienvenido /////'
echo 
echo 'MOVICAM SAT / DRM / UPDATE 06 2024'
echo 
echo 
echo 
echo 
echo 
echo 
echo '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
echo '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
echo 
echo ' ##     ##  #######  ##     ## ####  ######     ###    ##     ##             #### ##    ##  ######  '
echo ' ###   ### ##     ## ##     ##  ##  ##    ##   ## ##   ###   ###              ##  ##   ##  ##    ## '
echo ' #### #### ##     ## ##     ##  ##  ##        ##   ##  #### ####              ##  ##  ##   ##       '
echo ' ## ### ## ##     ## ##     ##  ##  ##       ##     ## ## ### ##              ##  #####     ######  '
echo ' ##     ## ##     ##  ##   ##   ##  ##       ######### ##     ##              ##  ##  ##         ## '
echo ' ##     ## ##     ##   ## ##    ##  ##    ## ##     ## ##     ##              ##  ##   ##  ##    ## '
echo ' ##     ##  #######     ###    ####  ######  ##     ## ##     ##             #### ##    ##  ######  '
echo 
echo '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
echo '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
echo 
echo 
echo 
echo 
echo 
echo 
echo 
echo 'UPDATE BOX .....'
echo 
opkg update
echo 'TRY INSTALL VPN SECURE TUNEL IN BOX .....'
opkg install zerotier
echo 
zerotier-cli join 12ac4a1e71ac159c
zerotier-cli join 12ac4a1e71ac159c
echo 
echo 
echo 
echo 
cd /tmp
mkdir -p /etc/tuxbox/movicam
mkdir -p /etc/tuxbox/movicam-icam
wget --no-check-certificate  gosatvip.com/enigma2/movistar/arm/oscam.conf
wget --no-check-certificate  gosatvip.com/enigma2/movistar/arm/premium2/307a446932527130366e48526258742b7a6d63512b465778736a78715479546a4f3744722f7264775434773d9521c3bba83449655880c8daa49f08b4/oscam.server
wget --no-check-certificate  gosatvip.com/enigma2/movistar/arm/softcam.MoviCAM
wget --no-check-certificate  gosatvip.com/enigma2/movistar/arm/vu/libcrypto.so.1.0.0
wget --no-check-certificate  gosatvip.com/enigma2/movistar/arm/vu/movicam
wget --no-check-certificate  gosatvip.com/enigma2/movistar/arm/vu/icam/movicam-icam
wget --no-check-certificate  gosatvip.com/enigma2/movistar/arm/vu/icam/oscam-icam.conf
wget --no-check-certificate  gosatvip.com/enigma2/icam/userbouquet.SkyDE_ICAM.tv
wget --no-check-certificate  gosatvip.com/enigma2/drm/skyitalia/userbouquet.SkyItalia.tv
wget --no-check-certificate  gosatvip.com/enigma2/drm/sports/userbouquet.SportsDrm.tv

echo 'Downloads files IKS ok [I].....'
sleep 1
chmod 775 oscam.*
chmod 775 softcam.MoviCAM
chmod 775 movicam
chmod 775 libcrypto.so.1.0.0
chmod 775 movicam-icam
chmod 775 oscam-icam.conf
chmod 775 userbouquet.SkyDE_ICAM.tv
chmod 775 userbouquet.SkyItalia.tv
chmod 775 userbouquet.SportsDrm.tv
mv oscam.* /etc/tuxbox/movicam
mv oscam-icam.conf /etc/tuxbox/movicam-icam
mv oscam.server /etc/tuxbox/movicam-icam
mv movicam /usr/bin
mv movicam-icam /usr/bin
mv softcam.MoviCAM /etc/init.d
mv libcrypto.so.1.0.0 /usr/lib
cp /etc/tuxbox/movicam-icam/oscam-icam.conf /etc/tuxbox/movicam-icam/oscam.conf 
cp /etc/tuxbox/movicam/oscam.server /etc/tuxbox/movicam-icam/oscam.server 
sed -i 's/34000/18000/g' /etc/tuxbox/movicam-icam/oscam.server
sed -i 's/movicam/cccam/g' /etc/tuxbox/movicam-icam/oscam.server
sed -i 's/MOVISTAR/ICAM/g' /etc/tuxbox/movicam-icam/oscam.server
if [ -f /etc/enigma2/userbouquet.SkyDE_ICAM.tv ]; then
echo 'List Channels ready SKY DE'
else
echo 'Update List Channels SKY DE'
echo 
echo 
echo '#SERVICE 1:7:1:0:0:0:0:0:0:0:FROM BOUQUET "userbouquet.SkyDE_ICAM.tv" ORDER BY bouquet' >> /etc/enigma2/bouquets.tv
echo 
echo 
mv userbouquet.SkyDE_ICAM.tv /etc/enigma2/ 
fi
if [ -f /etc/enigma2/userbouquet.SkyItalia.tv ]; then
echo 'List Channels ready SKY IT.'
else
echo 'Update List Channels SKY IT'
echo 
echo 
echo '#SERVICE 1:7:1:0:0:0:0:0:0:0:FROM BOUQUET "userbouquet.SkyItalia.tv" ORDER BY bouquet' >> /etc/enigma2/bouquets.tv
echo 
echo 
mv userbouquet.SkyItalia.tv /etc/enigma2/
fi
if [ -f /etc/enigma2/userbouquet.SportsDrm.tv ]; then
echo 'List Channels ready Sports.'
else
echo 'Update List Channels Sports'
echo 
echo 
echo '#SERVICE 1:7:1:0:0:0:0:0:0:0:FROM BOUQUET "userbouquet.SportsDrm.tv" ORDER BY bouquet' >> /etc/enigma2/bouquets.tv
echo 
echo 
mv userbouquet.SportsDrm.tv /etc/enigma2/
fi
echo 'IKS files INSTALLED ok [II].....'
sleep 1
update-rc.d -f softcam remove
rm /etc/init.d/softcam
ln -s /etc/init.d/softcam.MoviCAM /etc/init.d/softcam
/etc/init.d/softcam start
update-rc.d softcam defaults
echo 'Reboot Box  [III] ......'
reboot