require './manage_human'
def main	
	array_hash_human = [
		{:name=>"kien", :age=>20, :gender=>"male"}, 
		{:name=>"nam", :age=>15, :gender=>"male"}, 
		{:name=>"lan", :age=>21, :gender=>"female"},
		{:name=>"hoa", :age=>25, :gender=>"female"},		
	]

	manage_human = ManageHuman.new 
	manage_human.convert_array_hash_human_to_list_human array_hash_human

	array_human = manage_human.array_human
	puts "List people"
	manage_human.show_list_people	
	puts
	puts "List people age over 18"
	manage_human.show_list_people_over_age 18
	puts
	puts "List people gender by male"
	manage_human.show_list_people_by_gender "male"
end
main