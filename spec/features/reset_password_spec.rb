require 'rails_helper'

RSpec.describe "Resetting passwords" do
  let!(:user) { create :user, email: 'another@test.com', username: 'Another' }
  let(:mail) { UserMailer.password_reset(user) }
  
  before do
    user.send_password_reset
  end
  
  context 'visiting verification link' do
    it 'resets password' do
        visit edit_password_reset_url(user.password_reset_token)
        fill_in 'Password', with: 'rightpass' 
        fill_in 'Confirm password', with: 'rightpass'
        click_button "Update Password"
        expect(page).to have_content("Password has been reset")
    end
  end 
end