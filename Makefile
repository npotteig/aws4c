
VERSION=0.5
DNAME="aws4c-${VERSION}"

CFLAGS = -g -Wall
all: s3_test

aws4c.o: aws4c.h

s3_test: aws4c.o

dist:
	mkdir ${DNAME}
	cp `cat MANIFEST` ${DNAME}
	tar -czf aws4c.${VERSION}.tgz ${DNAME}

clean:
	-rm *.exe
	-rm s3_test
	-rm *.tgz
	-rm -rf ${DNAME}
	

LDLIBS=`curl-config --libs` -lcrypto
