$free_tax = ["books","headcache", "chocolate"]
class Product
	attr_accessor :number, :product, :price
	def initialize number, product, price
		@number = number
		@product = product
		@price = price		
	end
	
	def tax
		number_tax = 0
		if !(is_free_tax?)
			number_tax += 10
		end
		if is_inport?
			number_tax += 5
		end
		number_tax
	end
	def calculation_tax
		number * price * tax / 100
	end
	def calculation_price
		number * price
	end
	def to_s
		"#{@number}\t#{@product}\t#{calculation_price} + #{calculation_tax}"
	end
	private
	def is_free_tax?
		$free_tax.each do |item|
			if item.include? @product
				return true
			end
		end
		false
	end
	def is_inport?
		@product.downcase.start_with? "import"
	end
end
def sum_price array_product
	sum_price = 0
	array_product.each {|product| sum_price += product.calculation_price}
	sum_price
end
def sum_tax array_product
	sum_tax = 0
	array_product.each {|product| sum_tax += product.calculation_tax}
	sum_tax
end
def sum_money array_product
	sum = 0
	sum += sum_price array_product
	sum += sum_tax array_product
end
def input_product
	array_product = Array.new
	product = Product.new(2,"Import Book", 20)
	array_product << product
	product = Product.new(3,"chocolate", 30)
	array_product << product
	product = Product.new(5,"duong huu phuoc", 80)
	array_product << product
end
def input_product_file
	file = File.open("input_tax.txt","r")
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
def output_product array_product
	puts "Number \t Product \t Price"
	puts array_product
	print "Tong so thue: " 
	puts sum_tax array_product
	print "Tong tien: "
	puts sum_money array_product
end
def output_product_file array_product
	file = File.open("output_tax.txt","w+")
	if file
		file.puts "Number \t Product \t Price"
		file.puts array_product
		file.print "Tong so thue: " 
		file.puts sum_tax array_product
		file.print "Tong tien: "
		file.puts sum_money array_product
	else
		puts "Cannot open file"
	end	
	file.close
end
array_product = input_product_file
output_product array_product
output_product_file array_product

