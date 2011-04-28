SOURCE = src/main.xc EDAM.xn
FLAGS = -Wall -g -O2 -I.. -Isrc -report

ifeq "$(OS)" "Windows_NT"
DELETE = del
else
DELETE = rm -f
endif

basic.xe: ${SOURCE}
	xcc ${FLAGS} ${SOURCE} -o bin/edam.xe

clean:
	$(DELETE) bin\*.xe
