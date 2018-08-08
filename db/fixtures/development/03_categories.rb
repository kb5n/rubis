10.times do |i|
  Category.seed do |s|
    value = Faker::Coffee.unique.blend_name
    s.name = value.capitalize
    s.identifier = value.downcase.sub(/ /, '_')
    s.description = Faker::Lorem.sentence
    s.user_id = i.div(5) + 1
  end
end
