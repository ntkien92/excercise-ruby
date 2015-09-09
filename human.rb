class Human
	attr_accessor :name, :age, :gender
	def initialize (name, age, gender)
		@name = validate(name)
		@age = validate_age(age.to_i)
		@gender = validate(gender)
	end	
	def to_s
		"Name: #{@name}, Age: #{@age}, Gender: #{@gender}"
	end
	private 
	def validate name		
		if name.strip.length == 0
			name = "Unknown"
		end
		name
	end
	def validate_age age
		default_age = 20
		if age > 0 && age < 150
			return age
		else
			age = default_age
		end
	end
end
AGE = 18
def filter_gender (array_human, gender)
	array_new = array_human.select { |human| human.gender.eql? gender }
end
def filter_age (array_human)
	array_new = array_human.select {|human| human.age.to_i >= AGE}
end
def input_human
	array_human = Array.new
	human = Human.new("", 24, "Male")
	array_human << human
	human = Human.new("Lan", "20", "")
	array_human << human
	human = Human.new("Hoa", 22, "Female")
	array_human << human
	human = Human.new("Nam", "a", "Male")
	array_human << human
end

array_human = input_human
puts "--------List input Human----------"
puts array_human
puts
puts
puts "--------List Male over 18 ages----------"
array_gender = filter_gender(array_human, "Male")
array_age = filter_age array_gender
puts array_age