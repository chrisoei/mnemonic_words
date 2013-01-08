require 'contemporary_words'

class MnemonicWords

  attr_accessor :base, :p_error, :range, :n_digits, :multiplier, :word_list

  def initialize(range, p_error, base = 2357)
    @base = base
    @p_error = p_error
    @range = range
    @n_digits = (Math.log(@range.size, @base) - Math.log(@p_error, @base)).ceil
    @multiplier = ((@base ** @n_digits).to_f / @range.size).floor
    @word_list = ContemporaryWords.all[0..@base-1]
    true
  end

  def encode(x)
    y = x * @multiplier
    a = []
    while y > 0 do
      a.unshift y % @base
      y /= @base
    end
    a.map { |z| @word_list[z] }.join(' ')
  end

  def decode(s)
    y = s.split(/\s+/).inject(0) { |memo,x| memo * @base + @word_list.index(x) }
    return nil unless (y % @multiplier) == 0
    y / @multiplier
  end

end
