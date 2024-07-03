class ImportOrganizer
  include Interactor::Organizer

  organize [
    LoadFile,
    DetermineDelimiter,
    ParseCsv,
    ImportData
  ]

end
