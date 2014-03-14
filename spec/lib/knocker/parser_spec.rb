require 'spec_helper'

describe Knocker::Parser do

  it "should recognise a pattern" do
    expect {
      Knocker::Parser.new(config).find("pvtchatops")
    }.to_not raise_error
  end

  it "should return a pattern object" do
    expect(
      Knocker::Parser.new(config).find("pvtchatops")
    ).to be_a Knocker::Pattern
  end

  it "should return a pattern object with the correct name" do
    p = Knocker::Parser.new(config).find("pvtchatops")
    expect(p.name).to eq "pvtchatops"
  end

end