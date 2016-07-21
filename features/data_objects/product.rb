require 'ffaker'

class Product
    attr_accessor :name

    def initialize
        @name = FFaker::Product.product
    end
end