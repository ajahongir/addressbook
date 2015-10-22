class Contact < ActiveRecord::Base
  validates :first_name, uniqueness: { scope: :last_name }, if: "first_name.present?"
  validates :last_name, uniqueness: { scope: :first_name }, if: "last_name.present?"
  validate :at_least_one_name
  validate :at_least_one_contact

  serialize :phones, JSON
  serialize :emails, JSON

  def full_name
    "#{ first_name } #{ last_name }"
  end

  def phones
    Array.wrap(self[:phones])
  end

  def phones_str
    phones.join(';')
  end

  def emails
    Array.wrap(self[:emails])
  end

  def emails_str
    emails.join(';')
  end

  private
  def at_least_one_contact
    if self[:phones].blank? && self[:emails].blank?
      errors[:base] << I18n.t('model.contact.at_least_one_contact')
    end
  end

  def at_least_one_name
    if self[:first_name].blank? && self[:last_name].blank?
      errors[:base] << I18n.t('model.contact.at_least_one_name')
    end
  end
end
