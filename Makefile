include conf/Makefile.conf

dev_start:
	cp conf/nginx.dev.conf /etc/nginx/conf.d/${CONFIG}
	service nginx reload
	rm -rf public/assets/
	thin start -p 3000

prod_start:
	cp conf/nginx.conf /etc/nginx/conf.d/${CONFIG}
	service nginx reload
	mkdir ./logs/ 2>/dev/null; true
	mkdir -p public/assets/javascripts/; true
	mkdir -p public/assets/stylesheets/; true
	rake assets:compile; true
	thin start -S $(SOCKET) -l ./logs/server.log -P ./logs/pid.log -e production -s 1

prod_stop:
	rm -rf logs/*

prod_restart: prod_stop prod_start

deploy:
	rsync -avz --exclude '.git' . $(PROD_SERVER):$(PATH)
	ssh $(PROD_SERVER) 'cd $(PATH); make prod_restart'

default: server
