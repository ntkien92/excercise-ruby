require './ReadFileManager'
class ManageTax
	attr_reader :array_product
	def initialize array_product
		@array_product = array_product
	end
	#to calculate sum price
	#sum price = sum of product price
	def sum_price
		sum_price = 0
		@array_product.each {|product| sum_price += product.calculation_price}
		sum_price
	end
	#to calculate sum tax
	#sum tax = sum of product tax
	def sum_tax
		sum_tax = 0
		@array_product.each {|product| sum_tax += product.calculation_tax}
		sum_tax
	end
end
