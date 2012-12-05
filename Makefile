include conf/Makefile.conf

all: dev_start

bundle:
	jruby -S bundle

dev_start:
	cp conf/nginx.dev.conf /etc/nginx/conf.d/${CONFIG}
	service nginx reload
	rm -rf public/assets/
	puma ./config.ru -I ./ -p 3000 -e development

prod_start:
	cp conf/nginx.conf /etc/nginx/conf.d/${CONFIG}
	service nginx reload
	rm -f $(SOCKET)
	mkdir ./logs/ 2>/dev/null; true
	jruby --server --fast -S puma ./config.ru -I ./ -e production -b unix://$(SOCKET) -S ./logs/state.log -t 0:1 >> ./logs/server.log 2>&1 &

prod_stop:
	kill `grep -oe [0-9]* -m 2 ./logs/state.log`; true
	rm -rf logs/*

prod_restart: prod_stop prod_start

deploy:
	rsync -avz --exclude '.git' . $(PROD_SERVER):$(PATH)
	ssh $(PROD_SERVER) 'cd $(PATH); jruby -S bundle --deployment --binstubs --without development test'
	ssh $(PROD_SERVER) 'cd $(PATH); make prod_restart'
