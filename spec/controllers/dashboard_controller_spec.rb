require 'rails_helper'

RSpec.describe DashboardController, type: :controller do
  let(:user) { create(:user) }
  before { session[:user_id] = user.try(:id) }
  subject { response }

  context 'get :index' do
    before { get :index }

    context 'when authenticated' do
      it { is_expected.to have_http_status(:ok) }
      it { is_expected.to render_template('dashboard/index') }
    end

    context 'when not authenticated' do
      let(:user) { nil }
      it { is_expected.to redirect_to('/') }
    end
  end
end
