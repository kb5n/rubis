require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has valid factory' do
    expect(FactoryBot.build(:user)).to be_valid
  end

  it 'is invalid without name' do
    user = FactoryBot.build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include('can\'t be blank')
  end

  it 'is invalid without email address' do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include('can\'t be blank')
  end

  it 'is invalid with invalid email address' do
    user = FactoryBot.build(:user, email: 'test[at]example.com')
    user.valid?
    expect(user.errors[:email]).to include('is invalid')
  end

  it 'is invalid with duplicate email address' do
    user_created = FactoryBot.create(:user)
    user = FactoryBot.build(:user, email: user_created.email)
    user.valid?
    expect(user.errors[:email]).to include('has already been taken')
  end

  it 'is invalid with short password' do
    user = FactoryBot.build(:user, password: '..', password_confirmation: '..')
    user.valid?
    expect(user.errors[:password]).to include('is too short (minimum is 3 characters)')
  end

  it 'is invalid with wrong conform password' do
    user = FactoryBot.build(:user, password_confirmation: 'tested')
    user.valid?
    expect(user.errors[:password_confirmation]).to include('doesn\'t match Password')
  end

  it 'is invalid without blog_title' do
    user = FactoryBot.build(:user, blog_title: nil)
    user.valid?
    expect(user.errors[:blog_title]).to include('can\'t be blank')
  end
end
