require 'rails_helper'

RSpec.describe Comment, type: :model do
  let!(:new_comment) { create :comment }

  it { should validate_presence_of :commentable }
  it { should belong_to :commentable }
  it { should validate_presence_of :user }
  it { should belong_to :user }

  describe "to_s" do
    it "returns comment text" do
      new_comment.text = "Test comment"
      expect(new_comment.to_s).to eq("Test comment")
    end
  end
end
