require "test_helper"

describe Contact do

  describe "not valid" do
    it "wont be valid" do
      contact = Contact.new
      value(contact).wont_be :valid?
    end
  end

  describe "valid" do
    it "full name must be" do
      contact = Contact.new first_name: "Fname", emails: 'user@example.com'
      value(contact).must_be :valid?
    end
  end

  describe "full_name" do
    it "full name" do
      contact = contacts :valid_contact
      contact.full_name.must_equal 'Peter Barber'
    end
  end

  describe "full name duplition" do
    let(:contact) { Contact.new first_name: "Peter", last_name: 'Barber' }

    it "full name" do
      value(contact).wont_be :valid?
    end
  end
end
