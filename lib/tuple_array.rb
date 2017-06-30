class TupleArray
  POWERS_IN_ENGLISH = {
      0 => '',
      1 => 'ten',
      2 => 'hundred',
      3 => 'thousand',
      6 => 'million',
      9 => 'billion'
  }
  TENS_IN_ENGLISH = [
      '',
      'ten',
      'twenty',
      'thirty',
      'forty',
      'fifty',
      'sixty',
      'seventy',
      'eighty',
      'ninety'
  ]
  ONES_IN_ENGLISH = [
      'zero',
      'one',
      'two',
      'three',
      'four',
      'five',
      'six',
      'seven',
      'eight',
      'nine'
  ]
  def initialize(value)
    @number = value
    @single_array = single_array(value)
    @tuple_array = tuple_array(value)
    @triplet_array = triplet_array(value)
  end
  def single_array(value)
    rvalue = []
    while value > 0
      rvalue << value % 1_000
      value = value / 1_000
    end
    rvalue
  end
  def tuple_array(value)
    rvalue = []
    power = 0
    while value > 0
      rvalue << [power, value % 1_000]
      value = value / 1_000
      power += 3
    end
    rvalue
  end
  def triplet_array(value)
    rvalue = []
    power = 0
    while value > 0
      rvalue << [power, triplet_array_helper(value % 1_000)]
      value = value / 1_000
      power += 3
    end
    rvalue
  end
  def in_english
    rvalue = ""
    @tuple_array.reverse_each { |power, value| rvalue += " #{triplet_in_english(value)} #{POWERS_IN_ENGLISH[power]}" }
    rvalue
  end
  def in_english_2
    rvalue = ""
    @triplet_array.reverse_each { |tuple| rvalue += value_power_in_english(tuple)}
    rvalue
  end
  
  private
  
    def triplet_array_helper(value)
      rvalue = []
      power = 0
      while value > 0
        rvalue << [power, value % 100]
        value = value / 100
        power += 2
      end
      rvalue
    end

    def triplet_in_english(value)
      rvalue = ""
      rvalue += "#{ONES_IN_ENGLISH[value / 100]} #{POWERS_IN_ENGLISH[2]} #{tuple_in_english(value % 100)}"
      rvalue
    end
  
    def tuple_in_english(value)
      rvalue = ""
      rvalue += "#{TENS_IN_ENGLISH[value / 10]} #{ONES_IN_ENGLISH[value % 10]}"
      rvalue
    end

    def value_power_in_english(tuple)
      power, value = tuple
      puts "#{value}^#{power}"
      if power > 1
        "#{value_power_in_english(value)} #{POWERS_IN_ENGLISH[power]}"
      else if power > 0
        "#{TENS_IN_ENGLISH(value)}"
       else
        "#{ONES_IN_ENGLISH(value)}"
             end
      end
    end
end