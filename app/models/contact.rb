class Contact < ActiveRecord::Base
  validates :first_name, uniqueness: { scope: :last_name, message: "full_name already been taken" }
  validates :first_name, presence: true, if: "last_name.blank?"
  validates :phones, presence: true, if: "emails.blank?"

  serialize :phones, JSON
  serialize :emails, JSON

  def full_name
    "#{ first_name } #{ last_name }"
  end

  def phones
    Array.wrap(self[:phones])
  end

  def emails
    Array.wrap(self[:emails])
  end

  # Phone = Struct.new(:phone)
  # Email = Struct.new(:email)
  # def phones_form
  #   Array.wrap(self[:phones]).map { |phone| Phone.new(phone) }
  # end

  # def emails_form
  #   Array.wrap(self[:emails]).map { |email| Email.new(email) }
  # end
end
