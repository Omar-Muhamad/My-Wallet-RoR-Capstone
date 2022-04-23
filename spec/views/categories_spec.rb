require 'rails_helper'

RSpec.describe 'Category page', type: :feature do
  before :each do
    @user1 = User.new(name: 'Omar', email: 'eng.omarmuhammad@gmail.com', password: 'asd123')
    @user1.save
    visit new_user_session_path
    fill_in 'Email', with: @user1.email
    fill_in 'Password', with: @user1.password
    click_button 'Log in'
  end

  it 'should be able to see categories' do
    expect(page).to have_content('Categories')
  end

  it 'should be able to redirect to add new category' do
    click_link 'Add new category'
    expect(page).to have_current_path(new_category_path)
  end

  it 'should be able to save category' do
    click_link 'Add new category'
    fill_in 'category[name]', with: 'Category 1'
    fill_in 'category[icon]', with: 'url'
    click_button 'Save'
    expect(page).to have_content('Category 1')
  end
end
