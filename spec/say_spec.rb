require_relative 'spec-helper'

describe "Runs at all" do
  it "actually all loads" do
    assert true, "Yup. Loads"
  end
end

def eng(int)
  Say.new(int).in_english
end

def test_pairs(hsh)
  hsh.each_pair do |k, v|
    str = k.to_s
    it "Works for digit #{v}" do
      eng(v).must_equal str
    end
  end
end


describe "Edge cases" do
  it "works for zero" do
    eng(0).must_equal "zero"
  end

  it "works for 999,999,999" do
    eng(999_999_999_999).must_equal "nine hundred ninety-nine billion nine hundred ninety-nine million nine hundred ninety-nine thousand nine hundred ninety-nine"
  end

end

describe "tests arguments in range" do
  it "rejects -1" do
    proc {eng(-1)}.must_raise ArgumentError
  end

  it "rejects 1_000_000_000" do
    proc {eng(-1)}.must_raise ArgumentError
  end
end

describe "digits" do
  digits = {
    one:   1,
    two:   2,
    three: 3,
    four:  4,
    five:  5,
    six:   6,
    seven: 7,
    eight: 8,
    nine:  9,
    zero:  0
  }

  test_pairs(digits)

end

describe "Weird stuff" do
  it "11" do
    eng(11).must_equal 'eleven'
  end

  it '12' do
    eng(12).must_equal 'twelve'
  end
end

describe "teens" do
  teens = {
    thirteen: 13,
    fourteen: 14,
    fifteen: 15,
    sixteen: 16,
    seventeen: 17,
    eighteen: 18,
    nineteen: 19,
  }

  test_pairs(teens)
end

describe "multiples of ten" do
  m10 = {
    ten: 10,
    twenty: 20,
    thirty: 30,
    forty: 40,
    fifty: 50,
    sixty: 60,
    seventy: 70,
    eighty: 80,
    ninety: 90
  }

  test_pairs(m10)
end

describe "powers of ten" do
  p10 = {
    ten: 10,
    "one hundred" => 100,
    "one thousand" => 1000,
    "ten thousand" => 10_000,
    "one hundred thousand" => 100_000,
    "one million" => 1_000_000,
    "ten million" => 10_000_000,
    "one hundred million" => 100_000_000,
    "one billion" => 1_000_000_000
  }

  test_pairs(p10)
end

describe "a bit over" do
  abo = {
    "one hundred one" => 101,
    "one thousand one" => 1001,
    "one million one" => 1_000_001,
    "one billion one" => 1_000_000_001
  }

  test_pairs(abo)

end

describe "two nines" do
  twonines = {
    "ninety-nine" => 99,
    "nine hundred ninety" => 990,
    "nine thousand nine hundred" => 9900,
    "ninety-nine thousand" => 99_000,
    "nine hundred ninety thousand" => 990_000,
    "nine million nine hundred thousand" => 9_900_000,
    "nine billion nine hundred million" => 9_900_000_000
  }

  test_pairs(twonines)
end

describe "skip some orders of magnitude" do
  skipsome = {
    "nine billion twenty million" => 9_020_000_000,
    "one hundred ninety-nine" => 199,
  }

  test_pairs(skipsome)
end


describe "hyphenation" do
  hyp = {
    "twenty-three" => 23,
  }
end

describe "teens up a few orders of magnitude" do
  teensup = {
    "one thousand nine hundred" => 1900,
    "nineteen thousand" => 19_000,
    "nineteen thousand thirty" => 19_030,
    "eleven million two hundred twenty" => 11_000_220,
  }

  test_pairs(teensup)
end

describe "random other stuff" do
  ros = {
    "two hundred twenty thousand six hundred forty-two" => 220_642,
    "six million twenty-two thousand" => 6_022_000,
    "six thousand three hundred twenty-two" => 6322,
  }
  test_pairs(ros)
end
