all:
	pycco -i -p -l bash script/rc script/cibuild exec/block-open
	rsync -ia docs/. gh-pages/
