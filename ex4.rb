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

	def name
		return @name
	end

	def calories
		self
		return @calories
	end

	def calories= (calories)
		@calories = calories
	end

	def name= (name)
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

	def flavor
		return @flavor
	end

	def flavor= (flavor)
		@flavor = flavor
	end
end

jelly = JellyBean.new("jelly",10,"someFlavor")
puts jelly.calories
puts jelly.name
puts jelly.flavor
puts jelly.delicious?
puts jelly.healthy?
puts "\nSetando novamente"
jelly.calories= 2010
jelly.name= "outronome"
jelly.flavor= "black licorice"
puts jelly.calories
puts jelly.name
puts jelly.flavor
puts jelly.delicious?
puts jelly.healthy?