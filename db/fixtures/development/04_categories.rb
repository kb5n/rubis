5.times do
  Category.seed do |s|
    value = Faker::Coffee.unique.blend_name
    s.name = value.capitalize
    s.identifier = value.downcase.sub(/ /, '_')
    s.description = Faker::Lorem.sentence
  end
end
