Gem::Specification.new do |s|
  s.name = 'indented-tracer'
  s.version = '0.1.3'
  s.summary = 'indented-tracer'
  s.authors = ['James Robertson']
  s.files = Dir['lib/**/*.rb'] 
  s.signing_key = '../privatekeys/indented-tracer.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@jamesrobertson.eu'
  s.homepage = 'https://github.com/jrobertson/indented-tracer'
  s.required_ruby_version = '>= 2.1.2'
end
