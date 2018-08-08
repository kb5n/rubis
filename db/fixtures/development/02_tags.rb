20.times do |i|
  Tag.seed do |s|
    value = Faker::Color.unique.color_name
    s.name = value.capitalize
    s.identifier = value.downcase.sub(/ /, '_')
    s.user_id = i.div(10) + 1
  end
end
