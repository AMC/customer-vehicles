# frozen_string_literal: true

require 'rails_helper'

describe ImportData do
  let(:data) {
    [
      {
        customer: {
          first_name: 'Greta',
          last_name: 'Thunberg',
          email: 'greta@future.com'
        },
        vehicle: {
          category: 'sailboat',
          name: 'Fridays For Future',
          length: "32’"
        },
      }
    ]
  }

  subject(:context) { ImportData.call(data: data) }

  describe ".call" do
    context "when given valid data" do
      it "creates the customer and the vehicle" do
        expect(context).to be_a_success

        customer = Customer.find_by(email: data.first[:customer][:email])
        expect(customer).to have_attributes(data.first[:customer])

        # NOTE: length is parsed from a string into an integer
        vehicle_attributes = data.first[:vehicle].merge({length: data.first[:vehicle][:length].to_i})
        expect(customer.vehicles.first).to have_attributes(vehicle_attributes)
      end
    end

    context "when given duplicate data" do
      it "skips the import and continues to process the remaining records" do
        ImportData.call(data: data)
        expect(context).to be_a_success
        expect(Vehicle.count).to eq(1)

        ImportData.call(data: data)
        expect(context).to be_a_success
        expect(Vehicle.count).to eq(1)
      end
    end

    context "when given invalid data" do
      it "fails" do
        data.first[:customer] = nil
        expect(context).to be_a_failure
      end
    end
  end
end
