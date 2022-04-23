require 'rails_helper'

RSpec.describe 'Transaction page', type: :feature do
  before :each do
    @user1 = User.new(name: 'Omar', email: 'eng.omarmuhammad@gmail.com', password: 'asd123')
    @user1.save
    @category = Category.new(name: 'Category 1', icon: 'icon1')
    visit new_user_session_path
    fill_in 'Email', with: @user1.email
    fill_in 'Password', with: @user1.password
    click_button 'Log in'
    click_link 'Add new category'
    fill_in 'category[name]', with: @category.name
    fill_in 'category[icon]', with: @category.icon
    click_button 'Save'
  end

  it 'should be able to see transactions' do
    click_on 'Category 1'
    expect(page).to have_content('Transactions')
  end

  it 'should be able to redirect to add new transaction' do
    click_on 'Category 1'
    click_link 'Add new Transaction'
    expect(page).to have_current_path(new_payment_path)
  end

  it 'should be able to save transaction' do
    click_on 'Category 1'
    click_link 'Add new Transaction'
    fill_in 'payment[name]', with: 'Transaction 1'
    fill_in 'payment[amount]', with: 10
    first('#payment_category_ids option', minimum: 1).select_option
    click_button 'Save'
    click_on 'Category 1'
    expect(page).to have_content('Transaction 1')
  end
end
