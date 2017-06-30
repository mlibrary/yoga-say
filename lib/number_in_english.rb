module NumberInEnglish
  class << self
    def MINIMUM
      0
    end

    def MAXIMUM
      999_999_999_999
    end

    def zero
      {
        0 => 'zero'
      }
    end

    def ones
      {
        0 => 'zero',
        1 => 'one',
        2 => 'two',
        3 => 'three',
        4 => 'four',
        5 => 'five',
        6 => 'six',
        7 => 'seven',
        8 => 'eight',
        9 => 'nine'
      }
    end

    def preteens
      {
        11 => 'eleven',
        12 => 'twelve'
      }
    end

    def teens
      {
        13 => 'thirteen',
        14 => 'fourteen',
        15 => 'fifteen',
        16 => 'sixteen',
        17 => 'seventeen',
        18 => 'eighteen',
        19 => 'nineteen'
      }
    end

    def tens
      {
        10 => 'ten',
        20 => 'twenty',
        30 => 'thirty',
        40 => 'forty',
        50 => 'fifty',
        60 => 'sixty',
        70 => 'seventy',
        80 => 'eighty',
        90 => 'ninety'
      }
    end

    def powers_of_ten
      {
        0 => 'one',
        1 => 'ten',
        2 => 'hundred',
        3 => 'thousand',
        4 => 'ten thousand',
        5 => 'hundred thousand',
        6 => 'million',
        7 => 'ten million',
        8 => 'hundred million',
        9 => 'billion'
      }
    end

    def number_to_english(value)
      return zero[value] if value.zero?
      "#{number_to_english_worker(value)}"
    end

    private
      BILLION = 10 ** 9
      MILLION = 10 ** 6
      THOUSAND = 10 ** 3
      HUNDRED = 10 ** 2
      TEN = 10 ** 1
      ONE = 10 ** 0

      def number_to_english_worker(value)
        rvalue = ""
        case
        when value >= BILLION
          billions = value / BILLION
          rvalue += "#{number_to_english(billions)}" + " #{NumberInEnglish.powers_of_ten[9]}"
          remainder = value % BILLION
          rvalue += " #{number_to_english(remainder)}" unless remainder.zero?
        when value >= MILLION
          millions = value / MILLION
          rvalue += "#{number_to_english(millions)}" + " #{NumberInEnglish.powers_of_ten[6]}"
          remainder = value % MILLION
          rvalue += " #{number_to_english(remainder)}" unless remainder.zero?
        when value >= THOUSAND
          thousands = value / THOUSAND
          rvalue += "#{number_to_english(thousands)}" + " #{NumberInEnglish.powers_of_ten[3]}"
          remainder = value % THOUSAND
          rvalue += " #{number_to_english(remainder)}" unless remainder.zero?
        when value >= HUNDRED
          hundreds = value / HUNDRED
          rvalue += "#{number_to_english(hundreds)}" + " #{NumberInEnglish.powers_of_ten[2]}"
          remainder = value % HUNDRED
          rvalue += " #{number_to_english(remainder)}" unless remainder.zero?
        when value >= 20
          tens = value / TEN
          rvalue += "#{NumberInEnglish.tens[tens * TEN]}"
          remainder = value % TEN
          rvalue += "-#{number_to_english(remainder)}" unless remainder.zero?
        when value >= 13
          rvalue += "#{NumberInEnglish.teens[value]}"
        when value >= 11
          rvalue += "#{NumberInEnglish.preteens[value]}"
        when value == TEN
          rvalue += "#{NumberInEnglish.powers_of_ten[1]}"
        when value >= 2
          rvalue += "#{NumberInEnglish.ones[value]}"
        when value == ONE
          rvalue += "#{NumberInEnglish.powers_of_ten[0]}"
        else
        end
        rvalue
      end
  end
end
