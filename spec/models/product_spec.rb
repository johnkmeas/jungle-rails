require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    before(:each) do
      @cat = Category.find_or_create_by! name: "test"
    end

    it 'should save with all fields successfully' do
      @product = Product.new({
        category: @cat,
        name:  'Car',
        quantity: 100,
        price: 100.99,
      })
      expect(@product).to be_valid
    end

    it 'should have a valid name' do
      @product = Product.new({
        category: @cat,
        quantity: 100,
        price: 100.99
      })
      expect(@product).to_not be_valid
    end

    it 'should have a valid price' do
      @product = Product.new({
        category: @cat,
        name:  'Car',
        quantity: 100,
      })
      expect(@product).to_not be_valid
    end

    it 'should have a valid quanity' do
      @product = Product.new({
        category: @cat,
        name:  'Car',
        price: 100.99,
      })
      expect(@product).to_not be_valid
    end

    it 'should have a valid category' do
      @product = Product.new({
        name:  'Car',
        price: 100.99,
        quantity: 100,
      })
      expect(@product).to_not be_valid
    end
  end
end
