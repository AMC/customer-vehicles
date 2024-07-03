# frozen_string_literal: true

require 'rails_helper'

describe LoadFile do
  
  describe ".call" do
    context "when given a valid file" do
      subject(:context) { LoadFile.call(file: "spec/fixtures/files/customers.csv") }

      it "provides the file_contents" do
        expect(context).to be_a_success
        expect(context.file_content).to be
        expect(context.file_content.first).to eq("Greta,Thunberg,greta@future.com,sailboat,Fridays For Future,32’\n")
      end
    end

    context "when given an invalid file" do
      subject(:context) { LoadFile.call(file: "spec/fixtures/files/invalid-file") }

      it "fails" do
        expect(context).to be_a_failure
      end
    end
  end
end
