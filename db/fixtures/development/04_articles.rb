20.times do |i|
  Article.seed do |s|
    title = Faker::Book.unique.title
    s.title = title
    s.identifier = title.downcase.tr(' ', '_')
    s.status = Article.statuses.keys.sample.to_sym
    s.published_at = i.days.ago
    s.category_id = (i.div(10) * 5) + Faker::Number.between(1, 5)
    s.user_id = i.div(10) + 1
  end
end
