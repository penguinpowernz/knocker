require "knocker/version"
require "knocker/errors"
require "knocker/parser"
require "knocker/pattern"
require 'fileutils'

module Knocker
  class << self
    def config
      "#{ENV["HOME"]}/.config/knocker/config"
    end

    def pattern(name)
      config_exists!
      Knocker::Parser.new(File.read(config)).find(name)
    end

    def config_exists?
      File.exist? config
    end

    def config_exists!
      raise Knocker::Errors::ConfigNotFound unless config_exists?
    end

    def create_config
      FileUtils.mkdir_p File.dirname(Knocker.config)
      FileUtils.touch Knocker.config
    end
  end
end
