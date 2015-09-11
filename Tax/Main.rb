require './ManageTax'
require './ReadFileManager'

def main
	read_file = ReadFileManager.new("input_tax.txt")
	array_product = read_file.read_input_file
	array_product.each {|product| puts product.show_detail}
	manage_tax = ManageTax.new(array_product)
	puts "Tong thue: " << manage_tax.sum_tax.to_s
	puts "Tong gia tri: " << (manage_tax.sum_tax + manage_tax.sum_price).to_s

	write_file = ReadFileManager.new("output_tax.txt")
	write_file.write_output_file manage_tax
end
main
