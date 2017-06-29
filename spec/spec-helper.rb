$:.unshift File.join(File.dirname(__FILE__), '..', 'lib')

require 'minitest/spec'
require 'minitest/reporters'

MiniTest::Reporters.use!

require 'say'
require 'minitest/autorun'
