require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  subject { response }

  context 'get :index' do
    context 'when user is not already authenticated' do
      before { get :index }

      it { is_expected.to have_http_status(:ok) }
      it { is_expected.to render_template('welcome/index') }
    end

    context 'when the user is already authenticated' do
      let(:user) { create(:user) }

      before do
        session[:user_id] = user.id
        get :index
      end

      it { is_expected.to redirect_to(dashboard_path) }
    end
  end

  context 'post :login' do
    let(:user) { create(:user) }
    let(:login) { user.login }

    before { post :login, login: login, password: password }

    context 'with the correct password' do
      let(:password) { user.password }

      it { is_expected.to redirect_to(dashboard_path) }

      it 'sets the user_id in session' do
        expect(session[:user_id]).to eq(user.id)
      end
    end

    context 'with the wrong password' do
      let(:password) { 'YOU SHALL NOT PASS' }

      it { is_expected.to redirect_to(root_path) }

      it 'removes the user_id from the session' do
        expect(session[:user_id]).to be_nil
      end
    end
  end
end
