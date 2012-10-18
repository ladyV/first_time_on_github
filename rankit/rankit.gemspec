# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "Rankit"
  s.authors     = ["Vasilina"]
  s.email       = ["vasilina.mulyavina@gmail.com"]
  s.homepage    = ""
  s.summary     = "This is a command-line application that will calculate the ranking table for a soccer league."
  s.description = "This is a command-line application that will calculate the ranking table for a soccer league."

  s.rubyforge_project = "rankit"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.add_development_dependency('rdoc')
  s.add_development_dependency('unit-test')
  s.add_development_dependency('rake','~> 0.9.2')
  s.add_dependency('methadone', '~>1.2.1')
end
