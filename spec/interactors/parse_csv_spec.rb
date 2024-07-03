# frozen_string_literal: true

require 'rails_helper'

describe ParseCsv do

  describe ".call" do
    context "when given a valid file_content and delimiter" do
      subject(:context) { ParseCsv.call(
        delimiter: ',',
        file_content: ["Greta,Thunberg,greta@future.com,sailboat,Fridays For Future,32’\n"])
      }

      let(:expected) {
        [{
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
         }]
      }

      it "provides the data" do
        expect(context).to be_a_success
        expect(context.data).to eq(expected)
      end
    end

    context "when given an invalid file_content and delimiter" do
      subject(:context) { ParseCsv.call(
        delimiter: ',',
        file_content: ["I \"am bad data\n"]) # illegal quote in CSV
      }

      it "fails" do
        expect(context).to be_a_failure
      end
    end
  end
end
