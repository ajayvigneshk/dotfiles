#!/bin/bash
# Used to set sensitive information on specific git config files
GIT_CONFIG_DIR="$HOME/.config/git"
#decrypt once
jsonString=$(gpg -q --decrypt $HOME/.config/git/gitconfig.json.gpg)
max=$(jq '. | length' <<< $jsonString)
i=0
while [ $i -lt $max ]
do
	configFileName=$(jq -r ".[$i].configFileName" <<< $jsonString)
	userName=$(jq -r ".[$i].userName" <<< $jsonString)
	email=$(jq -r ".[$i].email" <<< $jsonString)
	git config --file="$GIT_CONFIG_DIR/$configFileName" user.name "$userName"
	git config --file="$GIT_CONFIG_DIR/$configFileName" user.email $email
	true $(( i++ ))
done
