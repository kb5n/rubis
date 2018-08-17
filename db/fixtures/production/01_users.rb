User.seed do |s|
  s.name = 'Administrator'
  s.email = 'admin@example.com'
  s.identifier = 'admin'
  s.role_type = :admin
  s.blog_title = 'rubis'
  s.blog_description = 'this is an example blog'
  s.blog_started_at = DateTime.current
  s.crypted_password = '$2a$10$jaTtxhcH1zk//NLYpHOhuOet3EZzqWdWAHtDgaXmmjAoFKJJ9BG4q'
  s.salt = 'J2svwB3sv6SzggZ7ZdHn'
end
