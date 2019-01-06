


deploy:
	scp _build/prod/appname/releases/0.1.0/appname.tar.gz demoserver.com:
	ssh demoserver.com "tar -xzf appname.tar.gz"
	ssh demoserver.com "bin/appname start"
