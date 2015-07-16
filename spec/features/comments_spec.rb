require 'rails_helper'

RSpec.describe "Managing comments" do
  let!(:article) { create :article }
  let!(:user) { create :user, email: 'bob@test.com', username: 'Bob' }
  let!(:new_comment) { create :comment, text: 'Test Comment', commentable: article }
  let!(:nested_comment) { create :comment, text: 'Nested Comment', commentable: new_comment }   

  before do
    sign_in(user)
    visit "/articles/#{article.id}"
  end

  context "viewing comments index page" do
    it "shows comment" do
      expect(page).to have_content(new_comment.text)
      expect(page).to have_content(nested_comment.text)  
    end
  end

  context "creating a comment" do
    it "displays new comment" do
      click_link 'New Comment'
      fill_in 'Text', with: 'Comment Creation'
      click_button 'Create Comment'
      expect(page).to have_content('Comment Creation')
    end

    context 'not logged in' do
      it "doesn't display new comment form" do
        click_link 'Log out'
        visit "/articles/#{article.id}"
        expect(page).not_to have_content('New Comment')
      end
    end
  end
end