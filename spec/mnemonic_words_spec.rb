require 'mnemonic_words'

describe MnemonicWords do

  it 'should convert a phone number to words' do
    mw = MnemonicWords.new((0..9999999999), 1)
    mw.p_error.should be_within(0.02).of(0.76)
    s = mw.encode(4155551212)
    s.should == 'clue brought dear'
    mw.decode(s).should == 4155551212
    mw.decode('clue brought deer').should be_nil
  end

  it 'should ignore spaces before and after phrases' do
    mw = MnemonicWords.new((0..9999999999), 1)
    mw.decode(' clue brought dear').should == 4155551212
    mw.decode('clue brought dear ').should == 4155551212
    mw.decode(' clue brought dear ').should == 4155551212
  end

end
