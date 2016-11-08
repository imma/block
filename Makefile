all: ../sub/exec/sub

../sub/exec/sub:
	git clone git@github.com:imma/sub ../sub/

etc:
	pycco -i -p -l bash script/profile script/cibuild exec/block-open
	rsync -ia docs/. gh-pages/

