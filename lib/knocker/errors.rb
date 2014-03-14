module Knocker
  module Errors
    class ConfigNotFound < StandardError; end
    class PatternNotFound < StandardError; end
    class NoHostSpecified < StandardError; end
  end
end