class Dessert
	def initialize(name, calories)
		@name = name
		@calories = calories
	end

	def healthy?
		@calories < 200
	end

	def delicious?
		return true
	end

	def get_name
		return @name
	end

	def get_calories
		return @calories
	end

	def set_calories(calories)
		@calories = calories
	end

	def set_name(name)
		@name = name
	end
end
class JellyBean < Dessert
	def initialize(name, calories, flavor)
		super(name,calories)
		@flavor = flavor
	end

	def delicious?
		@flavor != "black licorice"
	end

	def get_flavor
		return @flavor
	end

	def set_flavor(flavor)
		@flavor = flavor
	end
end

jelly = JellyBean.new("jelly",10,"someFlavor")
puts jelly.get_calories
puts jelly.get_name
puts jelly.get_flavor
puts jelly.delicious?
puts jelly.healthy?
puts "\nSetando novamente"
jelly.set_calories(2010)
jelly.set_name("outronome")
jelly.set_flavor("black licorice")
puts jelly.get_calories
puts jelly.get_name
puts jelly.get_flavor
puts jelly.delicious?
puts jelly.healthy?