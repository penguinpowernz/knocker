module Knocker
  module Errors
    class ConfigNotFound < StandardError; end
    class PatternNotFound < StandardError; end
    class NoHostSpecified < StandardError; end
    class NoKnockSpecified < StandardError; end
    class InvalidProtocol < StandardError; end
    class InvalidPort < StandardError; end
  end
end