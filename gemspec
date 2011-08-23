# -*- encoding: utf-8 -*-
$:.unshift File.expand_path("../lib", __FILE__)
require "indentation/version"

Gem::Specification.new do |s|
  s.name        = "indentation"
  s.version     = Indentation::VERSION
  s.authors     = ["Samuel Dana"]
  s.email       = ["s.dana@prometheuscomputing.com"]
  s.homepage    = ""
  s.summary     = %q{A library of extensions to Ruby's Array and String classes that allow indentation manipulation of Strings and Arrays of Strings.}
  s.description = %q{A library of extensions to Ruby's Array and String classes that allow indentation manipulation of Strings and Arrays of Strings.}

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
