require 'rails_helper'

RSpec.describe Vote, type: :model do
  let!(:new_article) { create :article, title: 'Comment tester' }
  let!(:upvote) { create :upvote, score: 1, voteable: new_article }
  let!(:downvote) { create :downvote, score: -1, voteable: new_article }

  it { should validate_presence_of :voteable }
  it { should belong_to :voteable }
  it { should validate_presence_of :user }
  it { should belong_to :user }

  describe "#upvote?" do
    context "is an upvote" do
    subject { upvote }

      it "returns true" do
        expect(subject.upvote?).to eq(true)
      end
    end

    context "is a downvote" do
      subject { downvote }

      it "returns false" do
        expect(subject.upvote?).to eq(false)
      end
    end
  end

  describe "#downvote?" do
    context "is a downvote" do
      subject { downvote }

      it "returns true" do
        expect(subject.downvote?).to eq(true)
      end
    end

    context "is an upvote" do
      subject { upvote }

      it "returns false" do
        expect(subject.downvote?).to eq(false)
      end
    end
  end
end
