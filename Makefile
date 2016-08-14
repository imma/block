all: ../sub/exec/sub
	pycco -i -p -l bash script/profile script/cibuild exec/block-open
	rsync -ia docs/. gh-pages/

../sub/exec/sub:
	git clone git@github.com:defn/sub ../sub/
