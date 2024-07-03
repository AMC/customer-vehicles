class LoadFile
  include Interactor
  delegate :file, to: :context

  def call
    begin
      context.file_content = File.readlines(file)
    rescue
      context.fail!(error: "Unable to load file")
    end
  end
end
