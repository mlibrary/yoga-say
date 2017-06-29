require 'say'

def padded_number n
  s = n.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse
  while s.length < 15
    s = " #{s}"
  end
  s
end

RSpec.describe Say do
  [ [              0, "zero"],
    [              1, "one"],
    [              2, "two"],
    [              3, "three"],
    [              4, "four"],
    [              5, "five"],
    [              6, "six"],
    [              7, "seven"],
    [              8, "eight"],
    [              9, "nine"],
    [             10, "ten"],
    [             11, "eleven"],
    [             12, "twelve"],
    [             13, "thirteen"],
    [             14, "fourteen"],
    [             15, "fifteen"],
    [             16, "sixteen"],
    [             17, "seventeen"],
    [             18, "eighteen"],
    [             19, "nineteen"],
    [             20, "twenty"],
    [             22, "twenty-two"],
    [             33, "thirty-three"],
    [             44, "forty-four"],
    [             55, "fifty-five"],
    [             66, "sixty-six"],
    [             77, "seventy-seven"],
    [             88, "eighty-eight"],
    [             99, "ninety-nine"],
    [            100, "one hundred"],
    [            400, "four hundred"],
    [            768, "seven hundred sixty-eight"],
    [          1_000, "one thousand"],
    [          1_100, "one thousand one hundred"],
    [          1_101, "one thousand one hundred one"],
    [          1_234, "one thousand two hundred thirty-four"],
    [          4_096, "four thousand ninety-six"],
    [          8_192, "eight thousand one hundred ninety-two"],
    [         16_384, "sixteen thousand three hundred eighty-four"],
    [         32_768, "thirty-two thousand seven hundred sixty-eight"],
    [         65_536, "sixty-five thousand five hundred thirty-six"],
    [        131_072, "one hundred thirty-one thousand seventy-two"],
    [        262_144, "two hundred sixty-two thousand one hundred forty-four"],
    [        524_288, "five hundred twenty-four thousand two hundred eighty-eight"],
    [      1_048_576, "one million forty-eight thousand five hundred seventy-six"],
    [      2_097_152, "two million ninety-seven thousand one hundred fifty-two"],
    [      4_194_304, "four million one hundred ninety-four thousand three hundred four"],
    [      8_388_608, "eight million three hundred eighty-eight thousand six hundred eight"],
    [     16_777_216, "sixteen million seven hundred seventy-seven thousand two hundred sixteen"],
    [     33_554_432, "thirty-three million five hundred fifty-four thousand four hundred thirty-two"],
    [     67_108_864, "sixty-seven million one hundred eight thousand eight hundred sixty-four"],
    [    134_217_728, "one hundred thirty-four million two hundred seventeen thousand seven hundred twenty-eight"],
    [    268_435_456, "two hundred sixty-eight million four hundred thirty-five thousand four hundred fifty-six"],
    [    536_870_912, "five hundred thirty-six million eight hundred seventy thousand nine hundred twelve"],
    [  1_073_741_824, "one billion seventy-three million seven hundred forty-one thousand eight hundred twenty-four"],
    [  2_147_483_648, "two billion one hundred forty-seven million four hundred eighty-three thousand six hundred forty-eight"],
    [  4_294_967_296, "four billion two hundred ninety-four million nine hundred sixty-seven thousand two hundred ninety-six"],
    [  8_589_934_592, "eight billion five hundred eighty-nine million nine hundred thirty-four thousand five hundred ninety-two"],
    [ 17_179_869_184, "seventeen billion one hundred seventy-nine million eight hundred sixty-nine thousand one hundred eighty-four"],
    [ 34_359_738_368, "thirty-four billion three hundred fifty-nine million seven hundred thirty-eight thousand three hundred sixty-eight"],
    [ 68_719_476_736, "sixty-eight billion seven hundred nineteen million four hundred seventy-six thousand seven hundred thirty-six"],
    [137_438_953_472, "one hundred thirty-seven billion four hundred thirty-eight million nine hundred fifty-three thousand four hundred seventy-two"],
    [274_877_906_944, "two hundred seventy-four billion eight hundred seventy-seven million nine hundred six thousand nine hundred forty-four"],

  ].each do |n, t|
    it "knows #{padded_number n} is #{t}" do
      subject = Say.new(n)
      expect(subject.in_english).to eq(t)
    end
  end
end
