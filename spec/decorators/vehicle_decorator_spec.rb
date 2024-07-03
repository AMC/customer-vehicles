# frozen_string_literal: true

require 'rails_helper'

describe VehicleDecorator do
  let(:vehicle) { Vehicle.new(category: 'sailboat', name: 'Fridays For Future', length: 32).decorate }

  it 'decorates the category' do
    expect(vehicle.category).to eq('Sailboat')
  end

  it 'decorates the length' do
    expect(vehicle.length).to eq('32 ft.')
  end
end
