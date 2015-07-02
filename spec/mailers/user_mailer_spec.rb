require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "password_reset" do  
    let!(:user) { create :user, email: 'bob@test.com', username: 'Bob' }
    let(:mail) { UserMailer.password_reset(user) }
    before do
      user.send_password_reset_token
    end
    it "renders the headers" do
      expect(mail.subject).to eq("Password Reset")
      expect(mail.to).to eq(["bob@test.com"])
      expect(mail.from).to eq(["admin@haxxor.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to have_content(edit_password_reset_url(user.password_reset_token))
    end
  end

end
