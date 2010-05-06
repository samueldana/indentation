$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'indentation/string_mod.rb'
require 'indentation/array_mod.rb'

module Indentation
  VERSION = '0.0.2'
end