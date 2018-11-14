#!/bin/bash

# get the gitflow-mul-ver
if [ ! -d "gitflow-plus" ];then
	git clone https://github.com/myzero1/gitflow-plus.git
else
	cd gitflow-plus;
	git pull;
	cd ..;
fi

# overwrite the .git/hooks/post-checkout
#cp -f post-checkout .git/hooks/post-checkout;
cp -f gitflow-plus/post-checkout .git/hooks/post-checkout;
