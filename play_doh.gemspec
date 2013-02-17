Gem::Specification.new do |the|
  the.name          = 'play_doh'
  the.version       = '0.0.1'
  the.date          = '2013-02-15'
  the.summary       = 'malleable mocks'
  the.description   = 'partial mocks on rr'
  the.authors       = ['limadelic']
  the.email         = 'limadelic@gmail.com'
  the.files         = `git ls-files -- lib/*`.split("\n").sort
  the.require_paths = ['lib']
  the.homepage      = 'https://github.com/limadelic/play_doh'
end