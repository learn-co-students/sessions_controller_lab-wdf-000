require 'rails_helper'

RSpec.describe "Welcome Page", type: :feature do
  it "welcomes the user with username when logged in" do
    visit login_path
    fill_in 'name', with: 'New user'
    click_button 'login'
    expect(page.body).to include "Hi, New user"
  end
  
  it "has a logout button" do
    visit login_path
    fill_in 'name', with: 'Another new user'
    click_button 'login'
    expect(page).to have_button('logout')
  end

  it "leads to the login page after logout" do
    visit login_path
    fill_in 'name', with: 'Normal user'
    click_button 'login'
    click_button 'logout'
    expect(page).to have_button('login')
  end
end
