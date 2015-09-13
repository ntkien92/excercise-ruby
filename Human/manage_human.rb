require './human'
class ManageHuman
	attr_reader :array_human
	def initialize
		@array_human = Array.new
	end
	def convert_array_hash_human_to_list_human array_hash_human
		array_hash_human.each do |human_hash|
			# human = Human.new human_hash[:name], human_hash[:age], human_hash[:gender] if check_validate_human_hash? human_hash
			# @array_human << human
			#check validate human
			if check_validate_human_hash? human_hash
				human = Human.new human_hash[:name], human_hash[:age], human_hash[:gender]
				array_human << human
			end
		end
		array_human
	end
	def show_list_people
		array_human.each {|human| puts human.show_details}
	end
	def show_list_people_over_age age
		array_filter_people_by_age = filter_people_by_age age
		array_filter_people_by_age.each {|human| puts human.show_details}
	end
	def show_list_people_by_gender gender
		array_filter_people_by_gender = filter_people_by_gender gender
		array_filter_people_by_gender.each {|human| puts human.show_details}
	end
	private
	#if name, gender nil return false
	#if age not from 1 to 150 return false
	def check_validate_human_hash? human_hash
		return false if human_hash[:name].length == 0
		return false unless human_hash[:age] > 0 && human_hash[:age] < 150
		return false if human_hash[:gender].length == 0
		true
	end
	def filter_people_by_gender gender
		array_human.select {|human| human.gender.strip.eql? gender}
	end
	def filter_people_by_age age
		array_human.select {|human| human.age.to_i >= age}		
	end
end
