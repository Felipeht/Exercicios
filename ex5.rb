class Class
	def attr_accessor_with_history(attr_name)
		attr_name = attr_name.to_s			# make sure it's a string
		attr_reader attr_name				# create the attribute's getter
		attr_reader attr_name+"_history" 	# create bar_history getter
		class_eval %Q/
			def #{attr_name}=(value)
				@#{attr_name} = value
				@#{attr_name}_history ||= [nil]
				@#{attr_name}_history.push(value)
			end
		/
	end
end

class Foo 
	attr_accessor_with_history :teste
end

f = Foo.new
f.teste = 1
f.teste = 2
puts f.teste_history
#f.bar_history # => if your code works, should be [nil,1,2]