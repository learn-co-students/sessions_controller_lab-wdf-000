require 'rails_helper'

describe 'Route to homepage' do
  it 'has an index page' do
    visit root_path
    expect(page.status_code).to eq(200)
  end
end

describe 'homepage' do
  before do
    visit root_path
  end

  context 'when logged out' do
    it 'has a login link' do
      expect(page).to have_link('Login', href: login_path)
    end

    it 'link redirects to login page' do
      click_link 'Login'
      expect(page.body).to include 'Please login:'
    end
  end

  context 'when logged in' do
    it 'welcomes the user' do
      click_link 'Login'
      fill_in('name', :with => 'Dong')
      find('input[value="login"]').click
      expect(page).to have_content("Hi, Dong")      
    end
  end
end