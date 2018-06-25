require 'rails_helper'

RSpec.describe Site, type: :model do
  it 'has valid factory' do
    expect(FactoryBot.build(:site)).to be_valid
  end

  it 'is invalid without title' do
    site = FactoryBot.build(:site, title: nil)
    site.valid?
    expect(site.errors[:title]).to include('can\'t be blank')
  end
end
