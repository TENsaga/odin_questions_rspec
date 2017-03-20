##
# Question #1 - Caesar-Cipher - Solution 1
# Convoluted for learning rspec purposes
class Odin
  def self.cipher_smooth(string, shift)
    raise ArgumentError, "Must use arguments: (String, Integer)" unless
                         (string.is_a? String) && (shift.is_a? Integer)
    raise ArgumentError, "String must only contain A-Za-z" if string =~ /\d/
    string.chars.map { |l| l_shift(l, shift) }.join
  end

  def self.l_shift(l, shift)
    if l =~ /[[:punct:]]|\s+/
      l
    elsif l =~ /[a-z]/
      ((l.ord + shift - 'a'.ord) % 26 + 'a'.ord).chr
    else
      l_shift(l.downcase, shift).upcase
    end
  end
end
