class HomeController < ApplicationController
  include Sortable
  def index
    columns = %w[customers.last_name customers.email category length]
    @vehicles = Vehicle.includes(:customer).order("#{sort_column(columns)} #{sort_direction}").decorate
  end

  def import
    result = ImportOrganizer.call(file: params[:file])
    result.success? ? flash[:notice] = 'Data imported successfully' : flash[:alert] = result.error

    redirect_back(fallback_location: root_path)
  end

  def delete_all
    Customer.destroy_all
    flash[:notice] = 'All data deleted successfully'

    redirect_back(fallback_location: root_path)
  end

  private


end
