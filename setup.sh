#!/bin/bash

COMMANDS=(apt curl git)

echo Checking for required packsge prior to the installation of brew.sh

for i in "${COMMANDS[@]}"
do
  if ! command -v ${i} &> /dev/null; then
    echo -e "\t ${i}: found"
  else
    echo -e "\t ${i}: not found"
    echo -e "installing required package ${i}, please enter password if/when prompted\n"
    sudo apt install ${i} -y
  fi
done

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
