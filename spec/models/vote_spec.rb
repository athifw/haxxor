require 'rails_helper'

RSpec.describe Vote, type: :model do
  let!(:new_article) { create :article, title: 'Comment tester' }
  let!(:upvote) { create :vote, score: 1, voteable: new_article }
  let!(:downvote) { create :vote, score: -1, voteable: new_article }

  it { should validate_presence_of :voteable }
  it { should belong_to :voteable }
  it { should validate_presence_of :user }
  it { should belong_to :user }

  describe "#upvote?" do
    it 'checks if vote is upvote' do
      expect(upvote.upvote?).to eq(true)
    end
  end

  describe "#downvote?" do
    it 'checks if vote is downvote' do
      expect(downvote.downvote?).to eq(true)
    end
  end
end
