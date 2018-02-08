Gem::Specification.new do |s|
  s.name = 'mindmap_mfm'
  s.version = '0.1.0'
  s.summary = 'Generates HTML with an embedded SVG hyperlinked mindmap along with associated anchored headings.'
  s.authors = ['James Robertson']
  s.files = Dir['lib/mindmap_mfm.rb']
  s.add_runtime_dependency('martile', '~> 0.8', '>=0.8.1')
  s.add_runtime_dependency('mindmapdoc', '~> 0.1', '>=0.1.2')
  s.add_runtime_dependency('kramdown', '~> 1.16', '>=1.16.2')
  s.signing_key = '../privatekeys/mindmap_mfm.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@jamesrobertson.eu'
  s.homepage = 'https://github.com/jrobertson/mindmap_mfm'
end
