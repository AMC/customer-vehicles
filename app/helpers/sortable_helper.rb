module SortableHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    if column == params[:sort_column] && params[:sort_direction] == 'asc'
      direction = 'desc'
    else
      direction = 'asc'
    end
    link_to title, { sort_column: column, sort_direction: direction }, { class: 'sort-link' }
  end
end
