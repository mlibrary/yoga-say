class Say
  attr_reader :num

  def initialize(num)
    @num = num
  end

  def in_english
    if num < 0 || num > 999_999_999_999
      raise ArgumentError.new("Numbers must be between 0 and 999,999,999,999")
    end
    phrase(num)
  end

  def phrase(remainder)
    words = []
    loop do
      if remainder >= 1_000_000_000
        words << phrase(remainder / 1_000_000_000) + " billion"
        remainder = remainder % 1_000_000_000
      elsif remainder >= 1_000_000
        words << phrase(remainder / 1_000_000) + " million"
        remainder = remainder % 1_000_000
      elsif remainder >= 1000
        words << phrase(remainder / 1000) + " thousand"
        remainder = remainder % 1000
      elsif remainder >= 100
        howmany = remainder / 100
        words << phrase(remainder / 100) + " hundred"
        remainder = remainder % 100
      elsif remainder >= 20
        if remainder % 10 == 0
          words << tens(remainder)
        else
          words << tens(remainder) + "-" + upto_nineteen(remainder % 10)
        end
        remainder = 0
      else
        words << upto_nineteen(remainder)
        remainder = 0
      end
      break if remainder == 0
    end
    words.join(' ')
  end

  def upto_nineteen(i)
    ['zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine', 'ten',
     'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen',
     'eighteen', 'nineteen'][i]
  end

  def tens(i)
    decade = i / 10
    prefix = ['', '', 'twenty', 'thirty', 'forty', 'fifty', 'sixty', 'seventy', 'eighty', 'ninety'][decade]
  end

end

module BookKeeping
  VERSION = 1
end
