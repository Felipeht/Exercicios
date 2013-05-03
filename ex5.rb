class Class
	def attr_accessor_with_history(attr_name)
		attr_name = attr_name.to_s			# make sure it's a string
		attr_reader attr_name				# create the attribute's getter
		attr_reader attr_name+"_history" 	# create bar_history getter
		class_eval %Q/
			def bar=(value)
				@bar = value
				@bar_history ||= [nil]
				@bar_history.push(value)
			end
		/
	end
end

class Foo
	attr_accessor_with_history :bar
end


f = Foo.new
f.bar = 1
f.bar = 2
puts f.bar_history
#f.bar_history # => if your code works, should be [nil,1,2]