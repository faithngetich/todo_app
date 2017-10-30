require 'rails_helper'

RSpec.describe User, type: :model do
  let(:valid_email) { 'dhh@nonopinionated.com' }
  let(:invalid_email_1) { 'base@example' }
  let(:invalid_email_2) { 'blah' }

  context 'with validations' do
    let(:user) { create(:user) }
    # validations
    it { expect(user).to allow_value(valid_email).for(:email) }
    it { expect(user).to_not allow_value(invalid_email_1).for(:email) }
    it { expect(user).to_not allow_value(invalid_email_2).for(:email) }
  end

  context 'with validations #2' do
    subject { build(:user) }

    # test email validation
    it { is_expected.to allow_value(valid_email).for(:email) }
    it { is_expected.not_to allow_value(invalid_email_1).for(:email) }
    it { is_expected.not_to allow_value(invalid_email_2).for(:email) }

    # test presence and uniqueness
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email) }
  end
end
