require 'csv'

class ImportService
  attr :file

  def initialize file
    @file = file
  end

  def call
    CSV.foreach(file, quote_char: '"', col_sep: ',', row_sep: :auto, headers: true) do |row|
      contact = Contact.find_or_initialize_by(first_name: row[0].strip, last_name: row[1].strip)
      contact.phones = row[2].strip
      contact.emails = row[3].strip
      contact.save
    end
  end

end
