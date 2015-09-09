class Human
	attr_accessor :name, :age, :gender
	def initialize (name, age, gender)
		@name = name
		@age = age
		@gender = gender
	end	
	def to_s
		"Name: #{@name}, Age: #{@age}, Gender: #{@gender}"
	end
end
AGE = 18
def filter_gender (array_human, gender)
	array_new = array_human.select { |human| human.gender.eql? gender }
end
def filter_age (array_human)
	array_new = array_human.select {|human| human.age >= AGE}
end
def input_human
	array_human = Array.new
	human = Human.new("Kien", 15, "Male")
	array_human << human
	human = Human.new("Lan", 20, "Female")
	array_human << human
	human = Human.new("Hoa", 22, "Female")
	array_human << human
	human = Human.new("Nam", 22, "Male")
	array_human << human
end

array_human = input_human
array_gender = filter_gender(array_human, "Male")
array_age = filter_age array_gender
puts array_age