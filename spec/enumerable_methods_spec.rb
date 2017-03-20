require_relative '../lib/enumerable_methods/enumerable_methods.rb'

# Odin Project - Create tests for 5 enumerable_methods
describe ".my_each" do
  context "given no block" do
    it "returns self" do
      expect([1, 2, 3].my_each).to eq [1, 2, 3]
    end
  end

  context "given proper array" do
    it "returns 1\n2\n3\n" do
      expect { [1, 2, 3].my_each { |i| p i } }.to output("1\n2\n3\n").to_stdout
    end
    it "returns a\nb\nc\n" do
      expect { %w(a b).my_each { |i| print "#{i} ok " } }.to output("a ok b ok ").to_stdout
    end
  end

  context "given proper hash" do
    it "returns a\n test\n" do
      expect { { a: "test" }.my_each { |i| puts i } }.to output("a\ntest\n").to_stdout
    end
  end

  context "given improper block" do
    it "returns NoMethodError" do
      expect { 5.my_each { |i| print i } }.to raise_error NoMethodError, "undefined method `my_each' for 5:Integer"
    end
  end
end

describe ".my_each_with_index" do
  it "returns each & index" do
    expect { [1, 2, 3].my_each_with_index { |ind, val| p ind, val } }.to output("0\n1\n1\n2\n2\n3\n").to_stdout
  end
end

describe ".my_select" do
  context "given block" do
    it "returns values greater than 2" do
      expect([2, 3, 4].my_select { |val| val if val > 2 }).to eq [3, 4]
    end
  end
end

describe ".my_all? true" do
  context [1, 2, 3].my_all? do
    it { is_expected.to be true }
  end

  context [nil, 2, 3].my_all? do
    it { is_expected.to be false }
  end

  context ".my_all? with true block" do
    it "returns true" do
      expect([2, 3, 4].my_all? { |val| val > 1 }).to be_truthy
    end
  end

  context ".my_all? with false block" do
    it "returns false" do
      expect([2, 3, 4].my_all? { |val| val < 3 }).to be_falsey
    end
  end
end

describe ".my_count" do
  context "given array with 3 items" do
    it "returns 3" do
      expect([1, 2, 3].my_count).to eq 3
    end
  end

  context "given array with 3 items & block" do
    it "returns 1 as 1 value matches 4" do
      expect([1, 2, 3, 4, 3, 2, 1].my_count { |val| val == 4 }).to eq 1
    end
  end
end
