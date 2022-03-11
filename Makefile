all:
	mkdir -p /home/tbillon/data/wp_data
	mkdir -p /home/tbillon/data/db_data
	docker-compose -f srcs/docker-compose.yml up

down:
	docker-compose -f srcs/docker-compose.yml down

rm_vols:
	docker volume rm srcs_wp_data
	docker volume rm srcs_db_data

rm_files:
	rm -rf /home/tbillon/data/wp_data
	rm -rf /home/tbillon/data/db_data

prune:
	docker system prune

clean:
	bash srcs/requirements/tools/clean.sh
