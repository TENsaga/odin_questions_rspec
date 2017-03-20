module Enumerable
  def my_each
    return self unless block_given?
    each do |i|
      yield(i)
    end
  end

  def my_each_with_index
    return self unless block_given?
    for ind in 0...self.length
      yield(ind, self[ind])
    end
  end

  def my_select
    return self unless block_given?
    result = []
    self.my_each { |x| result << yield(x) if yield(x) }
    result
  end

  def my_all?
    self.my_each do |x|
      if block_given?
        return false unless yield(x)
      else
        return false unless x
      end
    end
    true
  end

  def my_any?
    self.my_each do |x|
      if block_given?
        return true if yield(x)
      elsif x then return false
      end
    end
    false
  end

  def my_none?
    self.my_each do |x|
      if block_given?
        return false if yield(x)
      elsif x then return false
      end
    end
    true
  end

  def my_count
    count = 0
    self.my_each do |x|
      if block_given?
        count += 1 if yield(x)
      else
        count += 1
      end
    end
    count
  end

  def my_map(pro = Proc.new { |obj| obj })
    result = []
    self.my_each do |x|
      block_given? ? result << yield(x) : result << pro.call(x)
    end
    result
  end

  def my_map!
    return self unless block_given?
    self.replace(my_map(&Proc.new))
  end

  def my_inject(memo = self.first)
    (self.to_a)[1..-1].my_each do |item|
      memo = yield(memo, item)
    end
    memo
  end
end

def multiply_els(input)
  input.my_inject { |memo, x| memo * x }
end

[1, 2, 3].my_select { |val| val if val > 2 }
