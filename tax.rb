$free_tax = ["books","headcache", "chocolate"]
class Product
	attr_accessor :number, :product, :price
	def initialize number, product, price
		@number = number
		@product = product
		@price = price		
	end
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
	def tax
		number_tax = 0
		if is_free_tax? == false
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
	
end
array_product = Array.new
product = Product.new(2,"Import Book", 20)
array_product << product
product = Product.new(3,"chocolate", 30)
puts product.is_free_tax?
array_product << product
puts "Number \t Product \t Price"
puts array_product
print "Tong so thue: " 
puts sum_tax array_product
print "Tong tien: "
puts sum_price array_product
