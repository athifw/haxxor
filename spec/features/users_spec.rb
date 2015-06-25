require 'rails_helper'

RSpec.describe "Users" do
  describe "creating an account" do
    before do
      visit '/articles'
      click_link "Create an Account"
    end

    context "missing fields" do
      it "shows errors" do
        click_button "Create User"
        expect(page).to have_content("Username can't be blank")
        expect(page).to have_content("Email can't be blank")
        expect(page).to have_content("Password can't be blank") 
      end
    end

    context "mismatched passwords" do
      it "shows errors" do
        fill_in 'Password', with: 'rightpass' 
        fill_in 'Confirm password', with: 'wrongpass' 
        click_button "Create User"
        expect(page).to have_content("Password confirmation doesn't match Password")
      end
    end

    context "all fields present" do
      it "shows user created message" do
        fill_in 'Username', with: 'Test User 1'
        fill_in 'Email', with: 'user1@test.com'
        fill_in 'Password', with: 'rightpass' 
        fill_in 'Confirm password', with: 'rightpass'
        click_button "Create User"
        expect(page).to have_content("Account created.")
      end
    end

  end
end

