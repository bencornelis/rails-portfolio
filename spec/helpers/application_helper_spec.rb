require "rails_helper"

describe ApplicationHelper do
  describe "#convert_time" do
    it "converts a number of seconds to a descriptive string" do
      expect(convert_time(40)).to eq "40 seconds"
    end
    it "converts a number of seconds to minutes" do
      expect(convert_time(180)).to eq "3 minutes"
    end
    it "converts a number of seconds to hours" do
      expect(convert_time(3600)).to eq "1 hour"
    end
    it "converts a number of seconds to days" do
      expect(convert_time(3600*48)).to eq "2 days"
    end
  end
end
