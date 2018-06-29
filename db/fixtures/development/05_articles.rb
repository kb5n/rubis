10.times do |n|
  Article.seed do |s|
    title = Faker::Book.unique.title
    s.title = title
    s.identifier = title.downcase.tr(' ', '_')
    s.status = Article.statuses.keys.sample.to_sym
    s.published_at = n.days.ago
    s.category_id = Faker::Number.between(1, 5)
  end
end
