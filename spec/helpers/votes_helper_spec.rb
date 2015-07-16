require 'rails_helper'

RSpec.describe VotesHelper, type: :helper do
  let!(:article) { create :article, title: 'Comment tester' }
  let!(:user_novote) { create :user }
  let!(:user_upvote) { create :user }
  let!(:upvote) { create :upvote, score: 1, voteable: article, user: user_upvote }
  let!(:user_downvote) { create :user }
  let!(:downvote) { create :downvote, score: -1, voteable: article, user: user_downvote }

  describe "#upvote_link" do
    context "user has upvoted article" do
      it "returns Upvoted" do
        expect(upvote_link(article, user_upvote)).to eq('Upvoted')
      end
    end
    context "user has not voted on article or has downvoted article" do
      it "returns link to upvote" do
        link_upvote = %{<a rel="nofollow" data-method="post" href="/articles/#{article.id}/upvote">Upvote</a>}
        expect(upvote_link(article, user_novote)).to eq(link_upvote)
        expect(upvote_link(article, user_downvote)).to eq(link_upvote)
      end
    end
  end

  describe "#downvote_link" do
    context "user has downvoted article" do
      it "returns Downvoted" do
        expect(downvote_link(article, user_downvote)).to eq('Downvoted')
      end
    end
    context "user has not voted on article or has upvoted article" do
      it "returns link to downvote" do
        link_downvote = %{<a rel="nofollow" data-method="post" href="/articles/#{article.id}/downvote">Downvote</a>}
        expect(downvote_link(article, user_novote)).to eq(link_downvote)
        expect(downvote_link(article, user_upvote)).to eq(link_downvote)
      end
    end
  end
end