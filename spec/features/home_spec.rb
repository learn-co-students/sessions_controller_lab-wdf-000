require 'rails_helper'

  describe 'has home page or root route ' do
    it 'has index page' do
      visit root_path
      expect(page.status_code).to eq(200)
    end
  end

  describe 'homepage' do
    before do
      visit root_path
    end

  context 'when user is logged out' do
    it 'has a login link' do
      expect(page).to have_link('Login', href: login_path)
    end

    it 'redirects to login page via link' do
      click_link 'Login'
      expect(page.body).to include 'Please login:'
    end
  end

  context 'when user is logged in' do
    it 'welcomes the user' do
      click_link 'Login'
      fill_in('name', :with => 'Your Name Here')
      find('input[value="login"]').click
      expect(page).to have_content("Hi, Your Name Here")
    end
  end
end
