Gem::Specification.new do |s|
  s.name          = 'play_doh'
  s.version       = '0.0.1'
  s.date          = '2013-02-15'
  s.summary       = 'malleable mocks'
  s.description   = 'partial mocks on rr'
  s.authors       = ['limadelic']
  s.email         = 'limadelic@gmail.com'
  s.files         = `git ls-files -- lib/*`.split("\n").sort
  s.require_paths = ['lib']
  s.homepage      = 'https://github.com/limadelic/play_doh'
end