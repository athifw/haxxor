require 'rails_helper'

RSpec.describe "Managing sessions" do
  describe "signing in" do
    before do
      visit '/articles'
      click_link 'Log in'
    end
    context "with blank fields" do
      it "display errors" do        
        click_button 'Log in'
        expect(page).to have_content("Invalid email or password.")
      end
    end
    context "with valid credentials" do
      let!(:user) { create :user, email: 'bob@test.com', username: 'Bob' }
      it "logs in successfully" do
        fill_in 'Email', with: 'bob@test.com'
        fill_in 'Password', with: 'password'
        click_button 'Log in'
        expect(page).to have_content("Welcome Bob")
        expect(page).to have_content("Log out")
      end
    end
  end
  describe "logging out" do
    let!(:loginuser) { create :user, email: 'test@test.com' }
    it "allows user to log back in" do
      visit '/articles'
      click_link 'Log in'
      fill_in 'Email', with: 'test@test.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
      click_link 'Log out'
      expect(page).to have_content("Log in")
    end
  end
end
