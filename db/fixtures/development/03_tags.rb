10.times do
  Tag.seed do |s|
    value = Faker::Color.unique.color_name
    s.name = value.capitalize
    s.identifier = value.downcase.sub(/ /, '_')
  end
end
