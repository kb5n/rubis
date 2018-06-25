FactoryBot.define do
  factory :tag do
    sequence(:name) { |n| 'TAG' + n.to_s }
    sequence(:identifier) { |n| 'tag_' + n.to_s }
  end
end
