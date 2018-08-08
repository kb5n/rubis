2.times do |i|
  User.seed do |s|
    s.name = Faker::Name.name
    if i.zero?
      s.email = 'admin@example.com'
      s.identifier = 'admin'
      s.role_type = :admin
    else
      s.email = 'guest@example.com'
      s.identifier = 'guest'
      s.role_type = :guest
    end
    s.blog_title = Faker::RockBand.name
    s.blog_description = Faker::Lorem.sentence
    s.blog_started_at = 1.year.ago
    s.crypted_password = '$2a$10$jaTtxhcH1zk//NLYpHOhuOet3EZzqWdWAHtDgaXmmjAoFKJJ9BG4q'
    s.salt = 'J2svwB3sv6SzggZ7ZdHn'
  end
end
