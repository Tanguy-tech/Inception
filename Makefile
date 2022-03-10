all:
	docker-compose -f srcs/docker-compose.yml up

down:
	docker-compose -f srcs/docker-compose.yml down

rm_vols:
	docker volume rm srcs_wp
	docker volume rm srcs_db

rm_files:
	rm -rf /home/tbillon/data/wp
	rm -rf /home/tbillon/data/db

prune:
	docker system prune

clean:
	bash srcs/requirements/tools/clean.sh