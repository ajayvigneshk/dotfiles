#!/bin/bash
GIT_CONFIG_DIR="$HOME/.config/git"
#decrypt once
jsonString=$(gpg -q --decrypt $HOME/.config/git/gitconfig.json.gpg)
max=$(jq '. | length' <<< $jsonString)
i=0
while [ $i -lt $max ]
do
	gitDir=$(jq -r ".[$i].gitDir" <<< $jsonString)
	configName=$(jq -r ".[$i].configName" <<< $jsonString)
	userName=$(jq -r ".[$i].userName" <<< $jsonString)
	email=$(jq -r ".[$i].email" <<< $jsonString)
	sshCommand=$(jq -r ".[$i].sshCommand" <<< $jsonString)
	git config --file="$GIT_CONFIG_DIR/config" "includeif.$gitDir.path" $GIT_CONFIG_DIR/config-$configName
	git config --file="$GIT_CONFIG_DIR/config-$configName" user.name "$userName"
	git config --file="$GIT_CONFIG_DIR/config-$configName" user.email $email
	git config --file="$GIT_CONFIG_DIR/config-$configName" core.sshCommand "$sshCommand"
	true $(( i++ ))
done
