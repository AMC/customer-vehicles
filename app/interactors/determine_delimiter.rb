class DetermineDelimiter
  include Interactor
  delegate :file_content, to: :context

  def call
    if file_content.first.include?(',')
      context.delimiter = ','
    elsif file_content.first.include?('|')
      context.delimiter = '|'
    else
      context.fail!(error: 'Only CSV and pipe-delimited files are supported.')
    end
  end

  private


end
