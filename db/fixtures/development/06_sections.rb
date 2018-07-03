[*1..10].each do |article_id|
  10.times do |n|
    Section.seed do |s|
      s.article_id = article_id
      s.sequence = n
      content_type = Section.content_types.keys.sample.to_sym
      s.content_type = content_type
      case content_type
      when :paragraph then
        s.title = Faker::Lorem.sentence
        s.description = Faker::Lorem.paragraphs(3).join("\n")
      when :image then
        s.image_url = 'sample' + [*1..10].sample.to_s + '.jpg'
        s.title = Faker::Lorem.sentence
        s.description = Faker::Lorem.sentence
      when :link then
        s.url = Faker::Internet.url
        s.title = Faker::Lorem.sentence
        s.description = Faker::Lorem.paragraph
        s.source = Faker::RockBand.name
        s.image_url = 'sample' + [*1..10].sample.to_s + '.jpg'
      when :location then
        s.url = 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3283.8745950191246!2d138.82359055126088!3d34.60733248036276!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x60175658bfae6955%3A0x9ce747c38ab6ce3b!2z44OS44Oq44K-5rWc!5e0!3m2!1sja!2sjp!4v1529990163377'
        s.title = Faker::Lorem.sentence
        s.description = Faker::Lorem.paragraphs.join("\n")
      end
    end
  end
end
