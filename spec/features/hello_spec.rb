require 'rails_helper'

describe 'GET homepage' do
  it 'renders homepage' do
    visit root_path
    expect(page.status_code).to eq(200)
  end
end

describe 'Homepage' do
  before do
    visit root_path
  end

  context 'when logged out' do
    it 'has a login link or button' do
      expect(page).to have_selector(:link_or_button, 'login')
    end

    it 'link redirects to login page' do
      click_link 'login'
      expect(page.body).to include 'Enter username:'
    end
  end

  context 'when logged in' do
    it 'welcomes the user' do
      click_link 'login'
      fill_in('name', with: 'GLaDOS')
      find('input[value="login"]').click
      expect(page).to have_content("Hi, GLaDOS")      
    end

    it "has a logout button" do
      click_link 'login'
      fill_in('name', with: 'GLaDOS')
      click_button 'login'
      expect(page).to have_button('logout')
    end

    it "logout leads back to login page" do
      click_link 'login'
      fill_in('name', with: 'GLaDOS')
      click_button 'login'
      click_button 'logout'
      expect(page).to have_button('login')
    end
  end
 
end
