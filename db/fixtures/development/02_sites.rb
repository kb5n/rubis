Site.seed do |s|
  s.title = Faker::RockBand.name
  s.description = Faker::Lorem.sentence
end
