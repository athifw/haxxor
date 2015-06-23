require 'rails_helper'

RSpec.describe "Managing articles" do
  describe "viewing the index page" do
    let!(:posts) { create_list :article, 20 }
    let!(:old_post) { create :article, created_at: Time.now - 5.days }
    
    it "shows all articles" do
      visit '/articles'
      posts.each do |post|
        expect(page).to have_content(post.title)
      end
      expect(page).to_not have_content(old_post.title)      
    end    
  end
  
  context "creating an article" do
    before do
      visit '/articles'
      click_link "New Article"
    end

    context "missing some fields" do
      it "shows errors" do
        click_button "Create Article"
        expect(page).to have_content("Title can't be blank")
      end
    end

    context "all fields present" do
      it "displays article" do
        fill_in 'Title', with: 'Created Title'
        fill_in 'URL', with: 'http://github.com'
        fill_in 'Author', with: 'Me'
        click_button "Create Article"
        expect(page).to have_content("Created Title")
      end
    end
  end
end