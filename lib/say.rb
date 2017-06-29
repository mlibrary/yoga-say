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
  def phrase(number)
    words = []
    loop do
      if number >= 1_000_000_000
        if number > num
          words << phrase(number / num) + " million"
          number = num
        else
          words << phrase(number / 1_000_000_000) + " billion"
          number = number % 1_000_000_000
        end
      elsif number >= 1_000_000
        if number > num
          words << phrase(number / num) + " thousand"
          number = num
        else
          words << phrase(number / 1_000_000) + " million"
          number = number % 1_000_000
        end
      elsif number >= 1000
        if number > num
          words << phrase(number / num) + " hundred"
          number = num
        else
          words << phrase(number / 1000) + " thousand"
          number = number % 1000
        end
      elsif number >= 100
        if number > num
          words << phrase(number / num)
          number = num
        else
          words << phrase(number / 100) + " hundred"
          number = number % 100
        end
      elsif number >= 20
        if number % 10 == 0
          words << tens(number)
        else
          words << tens(number) + "-" + upto_nineteen(number % 10)
        end
        number = 0
      else
        words << upto_nineteen(number)
        number = 0
      end
      break if number == 0
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
