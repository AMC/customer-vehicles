# frozen_string_literal: true

require 'rails_helper'

describe DetermineDelimiter do

  describe ".call" do
    context "when given a valid ',' delimiter" do
      subject(:context) {
        DetermineDelimiter.call(file_content: ["Greta,Thunberg,greta@future.com,sailboat,Fridays For Future,32’\n"])
      }

      it "provides the delimiter" do
        expect(context).to be_a_success
        expect(context.delimiter).to eq(',')
      end
    end

    context "when given a valid '|' delimiter" do
      subject(:context) {
        DetermineDelimiter.call(file_content: ["Greta|Thunberg|greta@future.com|sailboat|Fridays For Future|32’\n"])
      }

      it "provides the delimiter" do
        expect(context).to be_a_success
        expect(context.delimiter).to eq('|')
      end
    end

    context "when given an invalid ';' delimiter" do
      subject(:context) {
        DetermineDelimiter.call(file_content: ["Greta;Thunberg;greta@future.com;sailboat;Fridays For Future;32’\n"])
      }

      it "provides the delimiter" do
        expect(context).to be_a_failure
      end
    end
  end
end
