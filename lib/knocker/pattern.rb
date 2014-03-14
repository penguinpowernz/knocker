module Knocker
  class Pattern
    attr_reader :name

    def initialize(name, text)
      @name = name
      @text = text
    end

    def to_hash
      {
        :host => host,
        :knock_command => knock_command,
        :name => @name
      }
    end

    def host
      host = @text.scan(/  h (.*)/).flatten.first
      raise Knocker::Errors::NoHostSpecified if host.nil? or host.blank?
    end

    def knock_command
      patterns = []

      patterns = @text.scan(/  ([ut]) (\d+)/).collect do |proto, port|
        valid_port!(port)
        "#{port}:#{protocol!(proto)}"
      end

      raise Knocker::Errors::NoKnockSpecified if patterns.empty?

      "knock #{host} #{patterns.join(" ")}"
    end

    def post_commands
      cmds = @text.scan(/^  c (.*)$/)
      cmds.map! do |cmd|
        cmd.gsub! /\$host/, host
      end
    end

    private

    def protocol!(char)
      return "udp" if char == "u"
      return "tcp" if char == "t"
      raise Knocker::Errors::InvalidProtocol, char
    end

    def valid_port!(port)
      raise Errors::InvalidPort, port if port.to_i.zero?
      raise Errors::InvalidPort, port if port.to_i > 65535
    end
  end
end