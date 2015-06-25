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

  describe "authenticate" do
    context "email and password match" do
      let!(:user) { create :user, email: 'tom@test.com' }
      it "returns user" do
        expect(User.authenticate('tom@test.com','password')).to eq(user)
      end
    end
    context "email and password don't match" do
      it "returns nil" do
        expect(User.authenticate('tom@test.com','wrongpass')).to eq(nil)
      end
    end
  end

end

