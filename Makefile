.PHONY: deps clean nginx phantomjs test nodeserver

DOMAIN=http://tesseract.local
PHANTOMPATH=tests/bin/phantomjs

-include CONFIG

default:	build

clean:
	rm -rf nginx-1* phantomjs-2* tests/bin/phantomjs tests/output/* vendor/*

build: deps nginx tests/bin/phantomjs build-node-deps

deps:
	mkdir -p vendor

nginx: 
	touch conf/error.log conf/access.log

nginx-start:
	touch conf/error.log conf/access.log
	#Test before running server
	./nginx-1*/objs/nginx -t -c ./conf/nginx.conf
	./nginx-1*/objs/nginx -c ./conf/nginx.conf &> /dev/null

phantomjs: tests/bin/phantomjs

tests/bin/phantomjs:
	mkdir -p vendor
	wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2 -P ./vendor
	tar -xvf ./vendor/phantomjs-2.1.1-linux-x86_64.tar.bz2 -C ./vendor/
	mkdir -p tests/bin/
	mkdir -p tests/output/
	ln -s ../../vendor/phantomjs-2.1.1-linux-x86_64/bin/phantomjs ${PHANTOMPATH}

test:
	./tests/bin/phantomjs ./tests/loadpage.js
	jasmine


build-node-deps:
	npm install -g phantomjs-prebuilt
	npm install -g jasmine
	npm install phantom-jasmine -g

nodeserver:
	npm install --save http-server

run-nodeserver:
	node node_modules/http-server/bin/http-server


