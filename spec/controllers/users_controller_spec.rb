require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { create(:user) }
  before { session[:user_id] = user.try(:id) }
  subject { response }

  context 'get :index' do
    before { get :index }

    it 'lists the users' do
      expect(assigns[:users]).to eq(User.all)
    end

    it { is_expected.to have_http_status(:ok) }
    it { is_expected.to render_template('users/index') }
  end

  context 'get :show' do
    before { get :show, id: user.id }

    it 'gets the user' do
      expect(assigns[:user]).to eq(user)
    end
  end

  context 'get :new' do
    before { get :new, id: user.id }

    it 'creates a user object' do
      expect(assigns[:user]).to be_a_new(User)
    end

    it { is_expected.to have_http_status(:ok) }
    it { is_expected.to render_template('users/new') }
  end

  context 'get :create' do
    let(:attrs) { { login: 'x', password: 'y' } }

    before { get :create, user: attrs }

    it 'creates the user' do
      expect(User.authenticate('x', 'y')).not_to be_nil
    end

    it { is_expected.to redirect_to(:users) }
  end

  context 'get :destroy' do
    before { get :destroy, id: user.id }

    it 'removes the user object' do
      expect { user.reload }.to raise_error
    end

    it { is_expected.to redirect_to(:users) }
  end

  context 'get :update' do
    let(:attrs) { { login: 'x', password: 'y' } }

    before { get :update, id: user.id, user: attrs }

    it 'updates the user object' do
      expect(User.authenticate('x', 'y')).not_to be_nil
    end

    it { is_expected.to redirect_to(:users) }
  end
end
