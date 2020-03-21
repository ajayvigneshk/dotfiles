#!/bin/sh
pwds=`gpg --decrypt ~/.config/mutt/env.gpg`
eval "$pwds"
exec mutt "$@"

