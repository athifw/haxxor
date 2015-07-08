require 'rails_helper'

RSpec.describe Vote, type: :model do
  it { should validate_presence_of :voteable }
  it { should belong_to :voteable }
  it { should validate_presence_of :user }
  it { should belong_to :user }
end
