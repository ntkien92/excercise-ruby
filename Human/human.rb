class Human
	attr_reader :name, :age, :gender
	DEFAULT_AGE = 20
	def initialize (name, age, gender)
		@name = name
		@age = age.to_i
		@gender = gender
	end
	#show information about human	
	def show_details
		"Name: #{@name}, Age: #{@age}, Gender: #{@gender}"
	end
end
