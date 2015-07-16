require 'rails_helper'

RSpec.describe "Resetting passwords" do
  let!(:user) { create :user, email: 'another@test.com', username: 'Another' }
    
  before do
    user.send_password_reset_token
    visit edit_password_reset_url(user.password_reset_token)
    fill_in 'Password', with: 'rightpass' 
    fill_in 'Confirm password', with: 'rightpass'
  end
  
  context 'visiting verification link' do
    it 'resets password' do
      click_button "Update Password"      
      expect(page).to have_content("Password has been reset")
    end
  end

  context 'visiting link after 2 hours' do
    it 'show error' do
      travel(3.hours) do
        click_button "Update Password"
        expect(page).to have_content("Password reset has expired.")
      end
    end
  end
end