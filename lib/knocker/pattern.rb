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
      host = @text.lines.collect { |line|
        match = line.match(/^  h (.*)$/)
        next if match.nil?
        match[1]
        break
      }.join("")

      raise Knocker::Errors::NoHostSpecified if host.nil? or host.blank?
    end

    def knock_command
      patterns = []

      @text.scan(/  ([ut]) (\d+)/) do |proto, port|
        patterns << "#{port}:#{proto}"
      end

      "knock #{host} #{patterns.join(" ")}"
    end
  end
end