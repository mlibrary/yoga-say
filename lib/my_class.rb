class MyClass

  attr_reader :number

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

  TENS_IN_ENGLISH = [
      'zero',
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

  POWERS_OF_THREE_IN_ENGLISH = [
      'unit',
      'thousand',
      'million',
      'billion'
  ]

  def initialize(number)
    @number = number
  end

  def triplets
    rvalue = []
    value = number
    while value > 0
      rvalue << value % 1_000
      value = value / 1_000
    end
    rvalue
  end

  def tuple_triplets
    rvalue = []
    value = number
    index = 0
    while value > 0
      rvalue << [value % 1_000, index]
      value = value / 1_000
      index = index + 1
    end
    rvalue
  end

  def digits_in_english
    rvalue = []
    value = number
    while value > 0
      rvalue << ONES_IN_ENGLISH[value % 10]
      value = value / 10
    end
    rvalue
  end

  def ones_in_english(triplet)
    ONES_IN_ENGLISH[(((triplet % 1_000) % 10) % 10)]
  end

  def tens_in_english(triplet)
    TENS_IN_ENGLISH[(((triplet % 1_000) / 10) % 10)]
  end

  def hundreds_in_english(triplet)
    "#{ONES_IN_ENGLISH[((triplet % 1_000) / 100)]} hundred"
  end

  def triplet_in_english(triplet)
    [ones_in_english(triplet), tens_in_english(triplet), hundreds_in_english(triplet)]
  end

  def powers_of_three_in_english
    rvalue = []
    value = number
    index = 0
    while value > 0
      rvalue << POWERS_OF_THREE_IN_ENGLISH[index]
      value = value / 1_000
      index = index + 1
    end
    rvalue
  end

  def triplets_in_english
    rvalue = []
    value = number
    while value > 0
      triplet = value % 1_000
      rvalue << triplet_in_english(triplet)
      value = value / 1_000
    end
    rvalue
  end

  def in_english
    rvalue = []
    triples = triplets
    triples.each_with_index do |triplet, index|
      rvalue << [POWERS_OF_THREE_IN_ENGLISH[index], triplet_in_english(triplet)]
    end
    rvalue
    rrvalue = []
    (rvalue.size).downto(1) do |index|
      rrvalue << [rvalue[index-1][1].reverse,rvalue[index-1][0]]
    end
    rrvalue.join(' ')
  end

end