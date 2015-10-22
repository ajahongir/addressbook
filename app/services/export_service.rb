require 'csv'

class ExportService
  HEADERS = ["First name", "Last name", "Phones", "Emails"]

  def call
    CSV.generate do |csv|
      csv << HEADERS
      Contact.find_each do |contact|
        csv << contact_to_array(contact)
      end
    end
  end

  private
  def contact_to_array contact
    [
      contact.first_name,
      contact.last_name,
      contact.phones_str,
      contact.emails_str
    ]
  end
end