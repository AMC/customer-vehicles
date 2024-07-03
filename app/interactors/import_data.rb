class ImportData
  include Interactor
  delegate :data, to: :context

  def call
    data.each do |item|
      begin
        customer = Customer.find_or_create_by(item[:customer])
        customer.vehicles.create(item[:vehicle])
      rescue ActiveRecord::RecordNotUnique
        next # skip this record if it already exists
      rescue
        context.fail!(error: "Unable to import data")
      end
    end

  end
end
