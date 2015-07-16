require 'rails_helper'

RSpec.describe Comment, type: :model do
  let!(:new_article) { create :article, title: 'Comment tester' }
  let!(:new_comment) { create :comment, commentable: new_article }
  let!(:nested_comment) { create :comment, commentable: new_comment }

  it { should validate_presence_of :commentable }
  it { should belong_to :commentable }
  it { should validate_presence_of :user }
  it { should belong_to :user }

  describe "#to_s" do
    it "returns comment text" do
      new_comment.text = "Test comment"
      expect(new_comment.to_s).to eq("Test comment")
    end
  end

  describe "#article" do
    it "returns article commented on" do
      expect(new_comment.article.to_s).to eq('Comment tester')
      expect(nested_comment.article.to_s).to eq('Comment tester')
    end
  end
end
