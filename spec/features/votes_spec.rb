require 'rails_helper'

RSpec.describe "Votes" do
  let!(:user) { create :user, email: 'bob@test.com', username: 'Bob' }
  let!(:article) { create :article }
  let!(:article_with_comment) { create :article }
  let!(:comment) { create :comment, commentable: article_with_comment }

  before do
    visit '/session/new'
    fill_in 'Email', with: 'bob@test.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'    
  end

  describe "upvoting an article" do
    it "adds article score" do
      visit "/articles/#{article.id}"
      within("#article_#{article.id}") do
        click_link "Upvote"
      end
      within("#article_#{article.id}") do
        expect(page).to have_content("Upvoted")
        expect(page).to have_content("Score: 1")
      end
    end
  end

  describe "downvoting an article" do
    it "subtracts article score" do
      visit "/articles/#{article.id}"
      within("#article_#{article.id}") do
        click_link "Downvote"
      end
      within("#article_#{article.id}") do
        expect(page).to have_content("Downvoted")
        expect(page).to have_content("Score: -1")
      end
    end
  end

  describe "upvoting a comment" do
    before do
      visit "/articles/#{article_with_comment.id}"
      within("#comment_#{comment.id}") do
        click_link 'Upvote'
      end
    end
    it "adds comment score" do
      within("#comment_#{comment.id}") do
        expect(page).to have_content("Upvoted")
        expect(page).to have_content("Karma: 1")
      end
    end
  end

  describe "downvoting a comment" do
    before do
      visit "/articles/#{article_with_comment.id}"
      within("#comment_#{comment.id}") do
        click_link 'Downvote'
      end
    end
    it "subtracts comment score" do
      within("#comment_#{comment.id}") do
        expect(page).to have_content("Downvoted")
        expect(page).to have_content("Karma: -1")
      end    
    end
  end
end