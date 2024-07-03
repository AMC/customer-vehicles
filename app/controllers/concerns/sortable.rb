module Sortable
  extend ActiveSupport::Concern

  included do
    helper_method :sort_column, :sort_direction
  end

  def sort_column(columns = [])
    columns.include?(params[:sort_column]) ? params[:sort_column] : 'created_at'
  end

  def sort_direction
    %w[asc desc].include?(params[:sort_direction]) ? params[:sort_direction] : 'desc'
  end
end
