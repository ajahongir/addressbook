class Contact < ActiveRecord::Base
  validates :first_name, uniqueness: { scope: :last_name, message: "full_name already been taken" }
  validates :first_name, presence: true, if: "last_name.blank?"
  validates :phones, presence: true, if: "emails.blank?"

  serialize :phones, JSON
  serialize :emails, JSON

  def full_name
    "#{ first_name } #{ last_name }"
  end
end
