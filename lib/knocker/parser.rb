module Knocker
  class Parser
    def initialize(config)
      @config = config.lines.reject { |line|
        line.start_with? "#"
      }.join("")
    end

    def find(name)
      has_pattern! name
      Pattern.new name, extract(name)
    end

    private

    def has_pattern!(name)
      raise Knocker::Errors::PatternNotFound unless 
        @config.include? "pattern #{name}"
    end

    def extract(name)
      start = @config.lines.index("pattern #{name}")
      
      @config.lines[start..-1].collect { |line|
        break if line.blank?
        line
      }.join("\n")
    end
  end
end