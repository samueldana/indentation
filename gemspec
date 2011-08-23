# -*- encoding: utf-8 -*-
$:.unshift File.expand_path("../lib", __FILE__)
require "indentation/version"

Gem::Specification.new do |s|
  s.name        = "indentation"
  s.version     = Indentation::VERSION
  s.authors     = ["Samuel Dana"]
  s.email       = ["s.dana@prometheuscomputing.com"]
  s.homepage    = ""
  s.summary     = %q{A plugin for Ruby Sequel that provides the ability to track changes in the database.}
  s.description = %q{A plugin for Ruby Sequel that provides the ability to track changes in the database.}

  s.rubyforge_project = "indentation"
  
  s.post_install_message = %q{-------------------------------------------------------------------------------
  Thanks for installing the indentation gem! :)

  For current information on indentation, see http://samueldana.github.com/indentation/
  -------------------------------------------------------------------------------}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
