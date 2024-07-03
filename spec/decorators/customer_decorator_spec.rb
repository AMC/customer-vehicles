# frozen_string_literal: true

require 'rails_helper'

describe CustomerDecorator do
  let(:customer) { Customer.new(first_name: 'Greta', last_name: 'Thunberg', email: 'greta@future.com').decorate }

  it 'decorates the name' do
    expect(customer.name).to eq('Thunberg, Greta')
  end
end
