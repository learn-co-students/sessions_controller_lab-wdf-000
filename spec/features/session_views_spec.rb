require 'rails_helper'

RSpec.describe "Hello Page", type: :feature do
  it "Greets the user with username when logged in" do
    visit login_path
    fill_in 'name', with: 'Grumpy Cat'
    click_button 'login'
    expect(page.body).to include 'Hi, Grumpy Cat'
  end

  it "Has a logout button" do
    visit login_path
    fill_in 'name', with: 'Another Cat'
    click_button 'login'
    expect(page).to have_button('logout')
  end

  it "Logout leads back to login page" do
    visit login_path
    fill_in 'name', with: 'Logout Cat'
    click_button 'login'
    click_button 'logout'
    expect(page).to have_button('login')
  end
end
