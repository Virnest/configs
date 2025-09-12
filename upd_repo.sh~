#! /bin/bash

current_datetime=$(date +"%Y-%m-%d %H:%M:%S")

echo "\n\n\n=== Copying .config ==="

  config_path=~/configs/home-usr/.config
  configs=`ls -a --ignore='.' --ignore='..' $config_path`

  usr_config=~/.config/

  for config in $configs
  do
    src=$usr_config$config 
    echo $src
    if [ -d $src ]; then
      echo "==========" "folder" $config "exists"
      cp -rv $src $config_path
      #echo `ls -a $src`
      #echo `ls -a $config_path/config_tmp` 
    else
      echo "==========" "folder" $config "don't exist"
    fi
  done

echo "\n\n\n=== Copying .bashrc ==="
  cp -rv ~/.bashrc ./home-usr/.bashrc


echo "\n\n\n=== Git Stuff"
  git add .
  git commit -m '$current_datetime'
  git push
