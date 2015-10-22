require "test_helper"
class ImportServiceTest < ActiveSupport::TestCase

  it "wont be valid" do
    file = File.open("#{ Rails.root }/tmp/data.csv")

    assert_difference("Contact.count", 1) do
      ImportService.new(file).call
    end
  end
end
