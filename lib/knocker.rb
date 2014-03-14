require "knocker/version"
require "knocker/errors"
require "knocker/parser"
require "knocker/pattern"

module Knocker
  
  def config
    "#{ENV["HOME"]}/.config/knocker/config"
  end

  def pattern(name)
    Knocker::Parser.new(config).find(name).to_hash
  end

end
