require 'rails_helper'

RSpec.describe OrganizationsController, type: :controller do
  let(:user) { create(:user) }
  before { session[:user_id] = user.try(:id) }
  subject { response }

  let(:organization) { create(:organization) }

  context 'get :index' do
    before { get :index }

    it 'lists the organizations' do
      expect(assigns[:organizations]).to eq(Organization.all)
    end

    it { is_expected.to have_http_status(:ok) }
    it { is_expected.to render_template('organizations/index') }
  end

  context 'get :show' do
    before { get :show, id: organization.id }

    it 'gets the organization' do
      expect(assigns[:organization]).to eq(organization)
    end
  end

  context 'get :new' do
    before { get :new, id: organization.id }

    it 'creates a organization object' do
      expect(assigns[:organization]).to be_a_new(Organization)
    end

    it { is_expected.to have_http_status(:ok) }
    it { is_expected.to render_template('organizations/new') }
  end

  context 'get :create' do
    let(:attrs) { attributes_for(:organization) }

    before { get :create, organization: attrs }

    it 'creates the organization' do
      expect(Organization.all).not_to be_empty
    end

    it { is_expected.to redirect_to(:organizations) }
  end

  context 'get :destroy' do
    before { get :destroy, id: organization.id }

    it 'removes the organization object' do
      expect { organization.reload }.to raise_error
    end

    it { is_expected.to redirect_to(:organizations) }
  end

  context 'get :update' do
    let(:attrs) { attributes_for(:organization) }

    before { get :update, id: organization.id, organization: attrs }

    it 'updates the organization object' do
      expect(Organization.all).not_to be_empty
    end

    it { is_expected.to redirect_to(:organizations) }
  end
end
