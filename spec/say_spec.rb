require 'say'

def english (n)
  subject = Say.new(n)
  subject.in_english
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
    #[        524_288, ""],
    #[      1_048_576, ""],
    #[      2_097_152, ""],
    #[      4_194_304, ""],
    #[      8_388_608, ""],
    #[     16_777_216, ""],
    #[     33_554_432, ""],
    #[     67_108_864, ""],
    #[    134_217_728, ""],
    #[    268_435_456, ""],
    #[    536_870_912, ""],
    #[  1_073_741_824, ""],
    #[  2_147_483_648, ""],
    #[  4_294_967_296, ""],
    #[  8_589_934_592, ""],
    #[ 17_179_869_184, ""],
    #[ 34_359_738_368, ""],
    #[ 68_719_476_736, ""],
    #[137_438_953_472, ""],
    #[274_877_906_944, ""],

  ].each do |n, t|
    it "knows #{n} is #{t}" do
      subject = Say.new(n)
      expect(subject.in_english).to eq(t)
    end
  end
end
