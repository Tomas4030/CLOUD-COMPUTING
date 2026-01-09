down: 
	docker compose exec down -v --remove-orphans
up: 
	docker compose exec  up --build api frontend database adminer

it:
	docker compose exec  run -it api bash

current:
	docker compose exec  -it cstrader poetry run alembic -c backend/alembic.ini current

migrate:
	docker compose exec  -it cstrader poetry run alembic -c backend/alembic.ini revision --autogenerate -m "${m}"

migrations:
	docker compose exec  -it cstrader poetry run alembic -c backend/alembic.ini upgrade head

create_admin:
	docker compose exec  up --build initialize_admin -d
popular:
	docker compose exec -it cstrader poetry run python backend/src/seed.py

test:
	docker compose exec -it cstrader poetry run pytest

install:
	poetry install
	
setup: install up migrations create_admin popular test 
