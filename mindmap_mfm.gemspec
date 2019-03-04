Gem::Specification.new do |s|
  s.name = 'mindmap_mfm'
  s.version = '0.3.0'
  s.summary = 'Generates HTML with an embedded SVG hyperlinked ' + 
      'mindmap along with associated anchored headings.'
  s.authors = ['James Robertson']
  s.files = Dir['lib/mindmap_mfm.rb']
  s.add_runtime_dependency('martile', '~> 1.1', '>=1.1.7')
  s.add_runtime_dependency('mindmapdoc', '~> 0.3', '>=0.3.4')
  s.add_runtime_dependency('kramdown', '~> 2.1', '>=2.1.0')
  s.add_runtime_dependency('html-to-css', '~> 0.1', '>=0.1.8')
  s.signing_key = '../privatekeys/mindmap_mfm.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@jamesrobertson.eu'
  s.homepage = 'https://github.com/jrobertson/mindmap_mfm'
end
