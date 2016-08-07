all:
	pycco -i -p -l bash script/profile script/cibuild exec/block-open
	rsync -ia docs/. gh-pages/
