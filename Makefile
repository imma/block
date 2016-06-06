all:
	pycco -i -p -l bash script/rc script/cibuild
	rsync -ia docs/. gh-pages/
