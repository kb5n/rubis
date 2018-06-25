require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'has valid factory' do
    expect(FactoryBot.build(:category)).to be_valid
  end

  it 'is invalid without name' do
    category = FactoryBot.build(:category, name: nil)
    category.valid?
    expect(category.errors[:name]).to include('can\'t be blank')
  end

  it 'is invalid without identifier' do
    category = FactoryBot.build(:category, identifier: nil)
    category.valid?
    expect(category.errors[:identifier]).to include('can\'t be blank')
  end

  describe 'it invalid with invalid format' do
    it 'is invalid contains special characters' do
      category = FactoryBot.build(:category, identifier: 'category:1-5$%')
      category.valid?
      expect(category.errors[:identifier]).to include('is invalid')
    end

    it 'is invalid contains japanese characters' do
      category = FactoryBot.build(:category, identifier: 'タグ１')
      category.valid?
      expect(category.errors[:identifier]).to include('is invalid')
    end

    it 'is valid contains well formatted characters' do
      category = FactoryBot.build(:category, identifier: '0123_789_abc_xyz_ABC_XYZ')
      expect(category).to be_valid
    end
  end

  it 'is invalid with duplicate identifier' do
    category_created = FactoryBot.create(:category)
    category = FactoryBot.build(:category, identifier: category_created.identifier)
    category.valid?
    expect(category.errors[:identifier]).to include('has already been taken')
  end
end
