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
		assert_equal "0.3%", @m.seconds_in_year(85000)
		assert_equal "0.0%", @m.seconds_in_year(23)
		
		assert_equal "1909563673262303232.0%", @m.seconds_in_year(6.022*10**23)
	end
	def test_convert_to_military
		assert_equal "12:45",@m.convert_to_military("12:45 pm")
		assert_equal "16:30", @m.convert_to_military("4:30 pm")
		assert_equal "0:04", @m.convert_to_military("12:04 am")
		assert_equal "20:00", @m.convert_to_military("8:00 pm")
		assert_equal "12:00", @m.convert_to_military("12:00 pm")
		assert_equal "23:59", @m.convert_to_military("11:59 pm")
	end
	#def test_
	#	assert_equal false, @m.okay?("12:30")
	#end
end
