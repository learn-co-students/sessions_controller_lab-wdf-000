require 'rails_helper'

  describe 'has route to login page ' do
    it 'displays new page' do
      visit login_path
      expect(page.status_code).to eq(200)
    end
  end

  describe 'login page' do
    before do
      visit login_path
    end

  context 'login' do
    it 'user can enter name and click login' do
      fill_in('name', with: 'Your Name Here')
      find('input[value="login"]').click
      expect(page).to have_content('Hi, Your Name Here')
    end

    it 'user gets redirected to login page if name is not entered' do
      find('input[value="login"]').click
      expect(page.body).to include 'Please login:'
    end
  end
end
