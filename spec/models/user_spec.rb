require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build(:user) }

  it { is_expected.to be_valid }

  context '::authenticate' do
    subject! { create(:user) }

    let(:login) { subject.login }
    let(:password) { subject.password }

    def run
      described_class.authenticate(login, password)
    end

    context 'with a valid password' do
      it 'returns the user' do
        expect(run).to eq(subject)
      end
    end

    context 'with an invalid password' do
      let(:password) { 'bzzt...wrong' }

      it 'returns nil' do
        expect(run).to be_nil
      end
    end

    context 'update_attributes' do
      let(:user) { { login: 'x', password: 'y' } }

      it 'updates the user attributes' do
        expect(subject.update_attributes(user)).to be true
      end

      it 'updates the login of user' do
        subject.update_attributes(user)
        expect(subject.login).to eq('x')
      end

      it 'updates the password of user' do
        subject.update_attributes(user)
        expect(subject.password).to eq('y')
      end
    end
  end
end
