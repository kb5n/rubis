setup-staging:
	cd ansible; ansible-playbook -i hosts/staging setup.yml

db-reset:
	rm -f db/*.sqlite3
	bundle exec rails db:migrate
	bundle exec rails db:seed_fu

clear-cache:
	bundle exec rake tmp:cache:clear

check:
	bundle exec rubocop

up: clear-cache
	foreman start
