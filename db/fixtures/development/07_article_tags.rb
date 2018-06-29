[*1..10].each do |article_id|
  [*2..4].sample.times do
    ArticleTag.seed do |s|
      s.article_id = article_id
      s.tag_id = Faker::Number.between(1, 10)
    end
  end
end
