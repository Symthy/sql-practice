
.PHONY: init-northwind
init-northwind:
	mkdir -p scripts/init/sql
	mkdir -p work
	cd work/ && git clone https://github.com/dalers/mywind.git
	cp work/mywind/northwind-data.sql scripts/init/sql
	cp work/mywind/northwind.sql scripts/init/sql/northwind-schema.sql
	rm -rf work

.PHONY: init-sakila
init-sakila:
	mkdir -p scripts/init/sql
	mkdir -p work
	cd work/ && \
	  curl -kOL https://downloads.mysql.com/docs/sakila-db.zip && \
	  unzip sakila-db.zip
	cp work/sakila-db/* scripts/init/sql
	rm -rf work

.PHONY: up
up:
	docker-compose up -d