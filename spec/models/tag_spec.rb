require 'rails_helper'

RSpec.describe Tag, type: :model do
  it 'has valid factory' do
    expect(FactoryBot.build(:tag)).to be_valid
  end

  it 'is invalid without name' do
    tag = FactoryBot.build(:tag, name: nil)
    tag.valid?
    expect(tag.errors[:name]).to include('can\'t be blank')
  end

  it 'is invalid without identifier' do
    tag = FactoryBot.build(:tag, identifier: nil)
    tag.valid?
    expect(tag.errors[:identifier]).to include('can\'t be blank')
  end

  describe 'it invalid with invalid format' do
    it 'is invalid contains special characters' do
      tag = FactoryBot.build(:tag, identifier: 'tag:1-5$%')
      tag.valid?
      expect(tag.errors[:identifier]).to include('is invalid')
    end

    it 'is invalid contains japanese characters' do
      tag = FactoryBot.build(:tag, identifier: 'タグ１')
      tag.valid?
      expect(tag.errors[:identifier]).to include('is invalid')
    end

    it 'is valid contains well formatted characters' do
      tag = FactoryBot.build(:tag, identifier: '0123_789_abc_xyz_ABC_XYZ')
      expect(tag).to be_valid
    end
  end

  it 'is invalid with duplicate identifier' do
    tag_created = FactoryBot.create(:tag)
    tag = FactoryBot.build(:tag, identifier: tag_created.identifier)
    tag.valid?
    expect(tag.errors[:identifier]).to include('has already been taken')
  end
end
