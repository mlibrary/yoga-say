#!/usr/bin/env ruby
require 'minitest/autorun'
require_relative 'lib/say'

# Common test data version: 1.0.0 be403e1
class SayTest < Minitest::Test
  def test_zero
    question = 0
    assert_equal('zero', Say.new(question).in_english)
  end
end
