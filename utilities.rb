module Utilities
	
	def leap_year? year
		div_by_400?(year) || !div_by_100?(year)	&& div_by_4?(year)
	end

	def seconds_in_year seconds
		seconds_per_year = 365*24*60*60.0
		'%.if' % percent(seconds, seconds_per_year) + %
	end

	def convert_to_military time
		hours, not_hours = time.split(":")
		minutes, am_or_pm = not_hours.split(" ")
		military_time = ""
	
		if !am?(am_or_pm) && hours.to_i != 12
				military_time = convert_time((hours.to_i + 12).to_s, minutes)
		elsif am?(am_or_pm) && hours.to_i == 12 
				military_time = convert_time((hours.to_i - 12).to_s, minutes)
		else
				military_time = convert_time(hours, minutes)
		end
		end
	end

	def convert2(x)
		a, b = x.split(":")
		c = ""

		if a.to_i < 12
			c = a + b + " am"
		else
			c = a + b + " pm"
		end

		return c

	end

	def okay(a, b)
		c = false
		if (a.split(":")[0].to_i >= 8 && b || a.split(":")[0].to_i >= 10 && !b) && a.split(":")[1].split(" ")[1] == 'pm'
			c = false
		else
			c = true
		end
		return c
	end

	def span(a, b)
		c = 0
		d = 0
		if a < b
			c = b
			d = a
		else
			c = a
			d = b
		end

		return ('%.1f' % (amount(c)[0..-2].to_f - amount(d)[0..-2].to_f)).to_s + '%'
	end
	
	private 
		def div_by_100? year
			year % 100 == 0
		end
		def div_by_400? year
			year % 400 == 0
		end
		def div_by_4? year
			year % 4 == 0 
		end
		def am? a
			a.downcase == 'am'
		end
		def convert_time a, b
			a + ":" + b
		end
		def percent a, b
			a / b *100
		end
end

#m = Class.new do
 #    include Utilities
  # 	end.new
#puts m.amount 1234556