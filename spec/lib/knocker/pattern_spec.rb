require 'spec_helper'

describe Knocker::Pattern do
  let(:pattern) { Knocker::Pattern.new("pvtchatops", pattern_text) }

  it "should return the host" do
    expect(pattern.host).to eq "myvps.example.com"
  end

  it "should return the knock command" do
    expect(pattern.knock_command).to eq "knock myvps.example.com 5445:udp 4456:tcp 63854:tcp"
  end

  it "should return the commands in an array" do
    expect(pattern.post_commands).to be_an Array
  end

  it "should substitute $host for the host name in commands" do
    expect(pattern.post_commands.first).to include(pattern.host)
  end

  it "should return the correct post commands" do
    expect(pattern.post_commands).to eq ["xchat --url=irc://myvps.example.com:36777/chatops"]
  end

end