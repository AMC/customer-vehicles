class VehicleDecorator < Draper::Decorator
  delegate_all
  decorates_association :customer

  def category
    object.category.titleize
  end

  def length
    "#{object.length} ft."
  end

end
