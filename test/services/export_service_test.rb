require "test_helper"

describe ExportService do

  describe "not valid" do
    it "wont be valid" do
      content = ExportService.new.call
      content.must_match "Peter"
      content.must_match "Barber"
    end
  end

end
