require './Product'
class ReadFileManager
	def initialize file_name
		@file_name = file_name
	end
	def read_input_file
		file = File.open(@file_name,"r")
		array_product = Array.new
		if file
			while (line = file.gets)
				array_split = line.split(',')
				product = Product.new(array_split[0].to_i, array_split[1], array_split[2].to_i)			
				array_product << product
			end
		else
			puts "Cannot open file"
		end
		file.close
		array_product
	end
	def write_output_file manage_tax
		file = File.open(@file_name,"w")
			if file
				file.puts "Number \t Product \t Price"
				manage_tax.array_product.each {|product| file.puts product.show_detail}
				file.print "Tong so thue: " 
				file.puts manage_tax.sum_tax
				file.print "Tong tien: "
				file.puts manage_tax.sum_price
			else
				puts "Cannot open file"
			end	
			file.close
	end
end
