require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject { create :comment }

  it { should validate_presence_of :article }
  it { should belong_to :article }
  it { should validate_presence_of :user }
  it { should belong_to :user }

  describe "to_s" do
    it "returns comment text" do
      subject.text = "Test comment"
      expect(subject.to_s).to eq("Test comment")
    end
  end
end
