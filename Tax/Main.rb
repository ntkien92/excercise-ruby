require './ManageTax'
require './ReadFileManager'

def main
	#To read file from input_tax.txt
	read_file = ReadFileManager.new("input_tax.txt")
	#create array product from readfile
	array_product = read_file.read_input_file
	#show product from array product
	array_product.each {|product| puts product.show_detail}
	#create manage_tax to calculation sum tax, sum price
	manage_tax = ManageTax.new(array_product)
	puts "Tong thue: " << manage_tax.sum_tax.to_s
	puts "Tong gia tri: " << (manage_tax.sum_tax + manage_tax.sum_price).to_s
	#write output to the file
	write_file = ReadFileManager.new("output_tax.txt")
	write_file.write_output_file manage_tax
end
main
