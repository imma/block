all: ../sub/exec/sub

../sub/exec/sub:
	git clone git@github.com:imma/sub ../sub/

docs:
	ln -nfs /data/nginx/html/$(shell basename $(PWD)) public
	ln -nfs $(BLOCK_PATH) themes
	hugo
