require 'rails_helper'

RSpec.describe User, type: :model do
  let(:valid_email) { "dhh@nonopinionated.com" }
  let(:invalid_email_1) { "base@example" }
  let(:invalid_email_2) { "blah" }

  context "validations" do
    let(:user) { create(:user) }
    # validations
    it { expect(user).to allow_value(valid_email).for(:email) }
    it { expect(user).to_not allow_value(invalid_email_1).for(:email) }
    it { expect(user).to_not allow_value(invalid_email_2).for(:email) }
  end

  context "validations #2" do
    subject { build(:user) }

    # test email validation
    it { should allow_value(valid_email).for(:email) }
    it { should_not allow_value(invalid_email_1).for(:email) }
    it { should_not allow_value(invalid_email_2).for(:email) }

    # test presence and uniqueness
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
  end
end
