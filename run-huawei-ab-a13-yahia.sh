#!/bin/bash

#Usage:
#sudo bash run-huawei-ab-a13-yahia.sh [/path/to/system.img] 
#cleanups
#A13 version
umount d

set -ex

origin="$(readlink -f -- "$0")"
origin="$(dirname "$origin")"


targetArch=64
srcFile="$1"




"$origin"/simg2img "$srcFile" s-ab-raw.img || cp "$srcFile" s-ab-raw.img

rm -Rf tmp
mkdir -p d tmp
e2fsck -y -f s-ab-raw.img
resize2fs s-ab-raw.img 5000M
e2fsck -E unshare_blocks -y -f s-ab-raw.img
mount -o loop,rw s-ab-raw.img d
(
	#----------------------------- Missing Huawei root folder -----------------------------------------------------		
	cd d
	
	
	cd system
		
		
	#---------------------------------Setting properties -------------------------------------------------
	

	
	
	
	# Remove non use apex vndk
	rm -rf "system_ext/apex/com.android.vndk.v29"
	rm -rf "system_ext/apex/com.android.vndk.v30"
	rm -rf "system_ext/apex/com.android.vndk.v31"
	rm -rf "system_ext/apex/com.android.vndk.v32"
	#-----------------------------vndk-lite ----
	cd ../d

	

)

sleep 1

umount d

e2fsck -f -y s-ab-raw.img || true
resize2fs -M s-ab-raw.img

mv s-ab-raw.img s-vndklite.img




