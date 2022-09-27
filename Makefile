build:
	docker-compose build

init:
	cp ./.env.example .env
	cp ./.env.testing.example .env.testing
	make down
	make build
	rm -rf ./docker/mysql/data
	make clean
	docker-compose run --rm php php artisan key:generate
	docker-compose run --rm php php artisan key:generate --env=testing
	php artisan migrate
	php artisan migrate --env=testing

up:
	docker-compose up -d

down:
	docker-compose down

clean:
	composer install
	composer dump-autoload
	php artisan optimize:clear

restart:
	docker-compose restart

test:
	docker-compose run --rm php ./vendor/bin/phpstan analyse --memory-limit=-1
	docker-compose run --rm php ./vendor/bin/phpunit

php:
	docker-compose exec php bash