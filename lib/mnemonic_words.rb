require 'contemporary_words'

# Bitcoin donation address: 1MWeioFdnwFZC8eqJwxjKcA3SErKxEBu8V

class MnemonicWords

  class << self

    attr_reader :multipliar

  end

  @multipliar = [ 955, 3798375, 4966887791, 4886399928973, 310731420136098447 ]

  attr_accessor :base, :p_error, :p_error_max, :range, :n_digits, :multiplier, :divisor, :word_list

  def initialize(range, p_error_max, base = 2357)
    @base = base
    @p_error_max = p_error_max
    @range = range
    @n_digits = (Math.log(@range.size, @base) - Math.log(@p_error_max, @base)).ceil
    @max_result = @base ** @n_digits
    @p_error = @range.size.to_f/@max_result
    @multiplier = (@n_digits > MnemonicWords.multipliar.size) ?
      (0.7 * @max_result).floor : MnemonicWords.multipliar[@n_digits - 1]
    @divisor = inverse(@multiplier, @max_result)
    @word_list = ContemporaryWords.all[0..@base-1]
    true
  end

  def encode(x)
    y = ((x - @range.begin) * @multiplier) % @max_result
    a = []
    while y > 0 do
      a.unshift y % @base
      y /= @base
    end
    a.map { |z| @word_list[z] }.join(' ')
  end

  def decode(s)
    indices = s.downcase.split(/\s+/).reject(&:empty?).map { |word| @word_list.index(word) }
    return nil if indices.any? &:nil?
    y = indices.inject(0) { |memo,x| memo * @base + x }
    result = ((y * @divisor) % @max_result) + @range.begin
    (@range === result) ? result : nil
  end

  def inspect
    "< n: #{@n_digits}, -log10(p): #{-Math.log10(@p_error)} >"
  end

  private

  # Adapted from http://www.dzone.com/snippets/modular-inverse-function
  def inverse(a, n )
    i = n
    v = 0 
    d = 1
    while a>0 do
      t = (i/a).floor
      x = a
      a = i % x
      i = x
      x = d
      d = v - t*x
      v = x
    end
    v %= n
    if (v<0)
      v = (v+n)%n
    end
    return v
  end

end
