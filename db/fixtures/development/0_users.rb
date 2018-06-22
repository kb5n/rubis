User.seed do |s|
  s.id = 1
  s.name = "Administrator"
  s.email = "admin@example.com"
  s.crypted_password = '$2a$10$jaTtxhcH1zk//NLYpHOhuOet3EZzqWdWAHtDgaXmmjAoFKJJ9BG4q'
  s.salt = 'J2svwB3sv6SzggZ7ZdHn'
end
