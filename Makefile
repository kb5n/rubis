setup-staging:
	cd ansible; ansible-playbook -i hosts/staging setup.yml

db-reset:
	rm -f db/*.sqlite3
	bundle exec rails db:create:all
	bundle exec rails db:migrate
	bundle exec rails db:seed_fu

console:
	bundle exec rails console

dbconsole:
	bundle exec rails dbconsole

routes:
	bundle exec rails routes

clear-cache:
	bundle exec rake tmp:cache:clear

rubocop:
	bundle exec rubocop

brakeman:
	bundle exec brakeman -5 -w 1 -z

haml-lint:
	bundle exec haml-lint

rspec:
	bundle exec rspec --format documentation

check: rubocop brakeman haml-lint rspec

up: clear-cache
	foreman start
