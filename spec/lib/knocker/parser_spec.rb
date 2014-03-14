require 'spec_helper'

describe Knocker::Parser do
  let(:parser) { Knocker::Parser.new(config) }

  it "should recognise a pattern" do
    expect { parser.find("pvtchatops") }.to_not raise_error
  end

  it "should return a pattern object" do
    expect(parser.find("pvtchatops")).to be_a Knocker::Pattern
  end

  it "should return a pattern object with the correct name" do
    expect(parser.find("pvtchatops").name).to eq "pvtchatops"
  end

  it "should raise PatternNotFound for non-existent pattern" do
    expect{parser.find("wut!")}.to raise_error Knocker::Errors::PatternNotFound
  end

end