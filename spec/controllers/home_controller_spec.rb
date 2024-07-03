# frozen_string_literal: true

require 'rails_helper'

describe HomeController do
  let(:file) { fixture_file_upload('customers.csv') }

  before do
    customer = Customer.create(first_name: 'Ricky', last_name: 'Bobby', email: 'fast@cougar.com')
    Vehicle.create(category: 'racecar', name: 'Wonder Bread', length: 17, customer: customer)
  end

  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end

    it 'assigns @vehicles' do
      get :index
      expect(assigns(:vehicles)).to eq(Vehicle.all.decorate)
    end
  end

  describe 'POST #import' do
    it 'imports vehicles from the file provided' do
      expect {
        post :import, params: { file: file }
      }.to change(Vehicle, :count).by(4)
      expect(response).to redirect_to(root_path)
    end
  end

  describe 'POST #delete_all' do
    it 'deletes all vehicles' do
      expect {
        post :delete_all
      }.to change(Vehicle, :count).by(-1)

      expect(response).to redirect_to(root_path)
    end
  end
end
