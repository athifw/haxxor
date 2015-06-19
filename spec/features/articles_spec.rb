require 'rails_helper'

RSpec.describe "Managing articles" do
  describe "viewing the index page" do
    let!(:post_1) { create :article }
    let!(:post_2) { create :article }
    
    it "shows all articles" do
      visit '/articles'
      expect(page).to have_content(post_1.title)
      expect(page).to have_content(post_2.title)
    end
  end
end