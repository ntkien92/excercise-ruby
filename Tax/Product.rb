
class Product
	attr_reader :number, :product, :price
	def initialize number, product, price
		@number = number
		@product = product
		@price = price		
	end
	
	def tax
		number_tax = 0
		number_tax += 10 unless free_tax?
		number_tax += 5 if import?
		number_tax
	end
	def calculation_tax
		number * price * tax / 100.0
	end
	def calculation_price
		number * price
	end
	def show_detail
		"#{@number}\t#{@product}\t#{calculation_price} + #{calculation_tax}"
	end
	private
	def free_tax?		
		free_product_tax = ["book", "headcache", "chocolate"]
		free_product_tax.each do |item|
			if item.include? @product
				return true
			end
		end
		false
	end
	def import?
		@product.downcase.start_with? "import"
	end
end