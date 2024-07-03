require 'csv'

# NOTE: This interactor could use CSV.parse instead of CSV.parse_line
# however other interactors benefit from the line-by-line parsing

class ParseCsv
  include Interactor
  delegate :file_content, :delimiter, to: :context

  def call
    context.data = []
    begin
      file_content.each do |line|
        (first_name, last_name, email, category, vehicle_name, length) = CSV.parse_line(line, col_sep: delimiter)
        context.data << {
          customer: {
            first_name: first_name,
            last_name: last_name,
            email: email
          },
          vehicle: {
            category: category,
            name: vehicle_name,
            length: length
          }
        }
      end
    rescue CSV::MalformedCSVError
      context.fail!(error: 'Invalid file_content')
    end
  end

end
