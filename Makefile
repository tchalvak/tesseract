
default:	build

clean:
	rm -rf nginx-1* phantomjs-2* tests/bin/phantomjs tests/output/*

build: nginx phantomjs


nginx: 
	touch conf/error.log conf/access.log

nginx-start:
	touch conf/error.log conf/access.log
	#Test before running server
	./nginx-1*/objs/nginx -t -c ./conf/nginx.conf
	./nginx-1*/objs/nginx -c ./conf/nginx.conf &> /dev/null

phantomjs:
	ifneq ("$(wildcard $(PHANTOMPATH))","")
		FILE_EXISTS = 1
	else
		FILE_EXISTS = 0
		wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2
		tar -xvf phantomjs-2.1.1-linux-x86_64.tar.bz2
		mkdir -p tests/bin/
		mkdir -p tests/output/
		mv phantomjs-2.1.1-linux-x86_64/bin/phantomjs ${PHANTOMPATH}
	endif

test:
	./tests/bin/phantomjs ./tests/loadpage.js


build-node-deps:
	npm install -g jasmine
	npm install phantom-jasmine -g



nodeserver:
	npm install --save http-server

run-nodeserver:
	node node_modules/http-server/bin/http-server


