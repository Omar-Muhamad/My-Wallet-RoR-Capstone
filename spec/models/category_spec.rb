require 'rails_helper'

RSpec.describe Category, type: :model do
  before :each do
    @user = User.new(name: 'Omar', email: 'eng.omarmuhammad@gmail.com', password: 'asd123')
    @category = Category.new(name: 'Cat 1', icon: 'icon', user: @user)
  end

  it 'name should be valid with correct parameters' do
    expect(@category).to be_valid
  end

  it 'name should be present' do
    @category.name = nil
    expect(@category).to_not be_valid
  end

  it 'icon should be present' do
    @category.icon = nil
    expect(@category).to_not be_valid
  end
end