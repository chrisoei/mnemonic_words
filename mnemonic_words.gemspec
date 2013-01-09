Gem::Specification.new do |s|
  s.name = 'mnemonic_words'
  s.version = '0.0.2'
  s.authors = 'Chris Oei'
  s.email = 'zlkm208-rubygems@yahoo.com'
  s.summary = 'Creates a mnemonic sequence of words representing an integer in a specified range.'
  s.files = [ 'lib/mnemonic_words.rb' ]
  s.require_paths = [ "lib" ]
  s.add_runtime_dependency 'contemporary_words'
  s.homepage = 'https://github.com/chrisoei/mnemonic_words'
end
