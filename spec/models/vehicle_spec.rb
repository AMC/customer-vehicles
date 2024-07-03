# frozen_string_literal: true

require 'rails_helper'

describe Vehicle, type: :model do
  let(:customer) { Customer.new(first_name: 'Greta', last_name: 'Thunberg', email: 'greta@future.com') }
  let(:vehicle) { Vehicle.new(category: 'sailboat', name: 'Fridays For Future', length: 32, customer: customer) }

  it 'is valid with valid attributes' do
    expect(vehicle).to be_valid
  end

  it 'is not valid without a category' do
    vehicle.category = nil
    expect(vehicle).to be_invalid
  end

  it 'is not valid without a name' do
    vehicle.name = nil
    expect(vehicle).to be_invalid
  end

  it 'is not valid without a length' do
    vehicle.length = nil
    expect(vehicle).to be_invalid
  end

  it 'normalizes the category before saving' do
    vehicle.category = "SAILBOAT"
    vehicle.save
    expect(vehicle.category).to eq('sailboat')
  end
end
