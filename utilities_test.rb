require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative 'utilities'

class Methods2Test < MiniTest::Test
	def setup
		@m = Class.new do
     include Utilities
   	end.new
	end

	def test_leap_year
		assert_equal true, @m.leap_year?(2008)
		assert_equal true, @m.leap_year?(2000)

		assert_equal false, @m.leap_year?(1000)
		assert_equal false, @m.leap_year?(1995)
	end

	def test_seconds_in_year
		assert_equal "3.9%", @m.seconds_in_year(1234556)
		assert_equal "0.0%", @m.seconds_in_year(23)
		assert_equal "0.3%", @m.seconds_in_year(85000)
		assert_equal "1909563673262303488.0%", @m.seconds_in_year(6.022*10**23)
		

	end
end
