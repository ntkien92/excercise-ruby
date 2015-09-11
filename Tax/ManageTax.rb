require './ReadFileManager'
class ManageTax
	attr_reader :array_product
	def initialize array_product
		@array_product = array_product
	end
	def sum_price
		sum_price = 0
		@array_product.each {|product| sum_price += product.calculation_price}
		sum_price
	end
	def sum_tax
		sum_tax = 0
		@array_product.each {|product| sum_tax += product.calculation_tax}
		sum_tax
	end
end
