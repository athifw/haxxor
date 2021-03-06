require 'rails_helper'

RSpec.describe Article, type: :model do
  it { should validate_presence_of :title }
  it { should validate_presence_of :url }
  it { should validate_presence_of :user }
  it { should belong_to :user }

  describe "#to_s" do
    it "returns article title" do
      subject.title = "Test title"
      expect(subject.to_s).to eq("Test title")
    end
  end
end
