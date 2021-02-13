[include]
	path = ~/.config/git/config-personal-sensitive.inc
[core]
	# This is to use specific ssh keys when used via ssh agent(works with keepassxc)
	sshCommand = ssh -o IdentitiesOnly=yes -o IdentityFile=~/.ssh/id_rsa -F /dev/null
