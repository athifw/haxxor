require 'rails_helper'

RSpec.describe "Managing comments" do
  let!(:article) { create :article }
  let!(:user) { create :user, email: 'bob@test.com', username: 'Bob' }
  before do
    visit '/session/new'
    fill_in 'Email', with: 'bob@test.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    visit "/articles/#{article.id}"
  end

  context "viewing comments index page" do
    let!(:new_comment) { create :comment, text: 'Test Comment', commentable: article }   
    it "shows comment" do
      click_link 'Show Comments'
      expect(page).to have_content(new_comment.text)  
    end
  end

  context "creating a comment" do
    it "displays new comment" do
      click_link 'New Comment'
      fill_in 'Text', with: 'Comment Creation'
      click_button 'Create Comment'
      click_link 'Show Comments'
      expect(page).to have_content('Comment Creation')
    end

    context 'not logged in' do
      it 'displays error' do
        click_link 'Log out'
        visit "/articles/#{article.id}"
        click_link 'New Comment'
        expect(page).to have_content('You must be logged in to access this section')
      end
    end
  end
end