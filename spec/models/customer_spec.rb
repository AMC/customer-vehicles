# frozen_string_literal: true

require 'rails_helper'

describe Customer do
  let(:customer) { Customer.new(first_name: 'Greta', last_name: 'Thunberg', email: 'greta@future.com') }

  it 'is valid with valid attributes' do
    expect(customer).to be_valid
  end

  it 'is not valid without a first name' do
    customer.first_name = nil
    expect(customer).to be_invalid
  end

  it 'is not valid without a last name' do
    customer.last_name = nil
    expect(customer).to be_invalid
  end

  it 'is not valid without an email' do
    customer.email = nil
    expect(customer).to be_invalid
  end
end
