Gem::Specification.new do |s| 
  s.name         = "RubyJack"
  s.version      = "1.0.1"
  s.author       = "Jeffrey Baird"
  s.email        = "jeff@jeffreyleebaird.com"
  s.homepage     = "http://www.jeffreyleebaird.com"
  s.summary      = "A simple text based black jack game that lacks serious features"
  s.description  = File.read(File.join(File.dirname(__FILE__), 'README'))

  s.files         = Dir["{bin,lib,spec}/**/*"] + %w(LICENSE README)
  s.test_files    = Dir["spec/**/*"]
  s.executables   = [ 'black_jack' ]

  s.required_ruby_version = '>=1.9'
  s.add_development_dependency 'rspec'
end