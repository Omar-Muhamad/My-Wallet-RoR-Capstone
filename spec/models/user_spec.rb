require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.new(name: 'Omar', email: 'eng.omarmuhammad@gmail.com', password: 'asd123')
  end

  it 'name should be valid with correct parameters' do
    expect(@user).to be_valid
  end

  it 'name should be present' do
    @user.name = nil
    expect(@user).to_not be_valid
  end
end