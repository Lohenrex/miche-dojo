require "spec"
require "./stop_spinning_my_words"

describe "#spins?" do
  it "should spin a single word if it is longer than 4 characters" do
    spin_words("Welcome").should eq "emocleW"
  end

  it "should spin words longer that 4 characters" do
    spin_words("Hey fellow warriors").should eq "Hey wollef sroirraw"
  end
end
