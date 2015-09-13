
class Product
	attr_reader :number, :product, :price
	def initialize number, product, price
		@number = number
		@product = product
		@price = price		
	end
	#if product is of products free tax is 0
	#else tax is 10
	#if product is import, tax plus 5%
	def tax
		number_tax = 0
		number_tax += 10 unless free_tax?
		number_tax += 5 if import?
		number_tax
	end
	#tax is sum price mul tax
	def calculation_tax
		calculation_price * tax / 100.0
	end
	#price is number mul price of product
	def calculation_price
		number * price
	end
	#show detail to show product
	def show_detail
		"#{@number}\t#{@product}\t#{calculation_price} + #{calculation_tax}"
	end
	private
	#if product have one of list free_tax, product is free tax
	#else product is not free tax
	def free_tax?		
		free_product_tax = ["book", "headcache", "chocolate"]
		free_product_tax.each do |item|
			if item.include? @product
				return true
			end
		end
		false
	end
	#if product have a "import" in the first, product is a import
	def import?
		@product.downcase.start_with? "import"
	end
end