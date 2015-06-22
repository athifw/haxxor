require 'rails_helper'

RSpec.describe "Managing articles" do
  describe "viewing the index page" do
    let!(:post_1) { create :article }
    let!(:post_2) { create :article }

    it "shows all articles" do
      visit '/articles'
      expect(page).to have_content(post_1.title)
      expect(page).to have_content(post_2.title)
      page.body.index(post_2.title).should < page.body.index(post_1.title) 
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