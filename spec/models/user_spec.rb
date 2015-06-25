require 'rails_helper'

RSpec.describe User, type: :model do
  subject { create :user }
  
  it { should validate_presence_of :username }
  it { should validate_presence_of :email }
  it { should validate_uniqueness_of :username }
  it { should validate_uniqueness_of :email }
  
  describe "to_s" do
    it "returns username" do
      subject.username = "Test name"
      expect(subject.to_s).to eq("Test name")
    end
  end

end

