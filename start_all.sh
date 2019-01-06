#!/bin/bash


vagrant ssh alpha   --command "cd /vagrant && MIX_ENV=prod REPLACE_OS_VARS=true mix do deps.get, compile, release"

vagrant ssh alpha   --command "/vagrant/start.sh"
vagrant ssh bravo   --command "/vagrant/start.sh"
