all: ../sub/exec/sub

../sub/exec/sub:
	git clone git@github.com:imma/sub ../sub/

include $(BLOCK_PATH)/docs/Makefile.docs
