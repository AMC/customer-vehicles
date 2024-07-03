class CustomerDecorator < Draper::Decorator
  delegate_all

  def name
    "#{last_name}, #{first_name}"
  end
end
