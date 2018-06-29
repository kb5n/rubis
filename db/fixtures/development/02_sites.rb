Site.seed do |s|
  s.title = Faker::RockBand.name
  s.description = Faker::Lorem.sentence
  s.copyright = Faker::Company.name
  s.started_at = 1.year.ago
end
