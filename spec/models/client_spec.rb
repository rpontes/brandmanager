require 'spec_helper'

describe Client do
  context "validations" do
    it "accepts valid attributes" do
      client = Client.new({:name => "Some Client", :telephone => "4833333333"})
      expect(client).to be_valid
    end

    it "requires name to be set" do
      client = Client.create({:name => nil, :telephone => "4833333333"})
      expect(client).to have(1).error_on(:name)
    end
  end
end
