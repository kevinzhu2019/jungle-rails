RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it "save successfully" do
      category = Category.new(:name => 'new_category').save
      product = Product.new(:name => 'product_name', :description => 'some description', :image => 'image location', :price_cents => 1, :quantity => 1, :category_id => 1).save
      expect(product).to eq(true)
      expect(category).to eq(true)
    end
    
    it "name presence" do
      category = Category.new(:name => 'new_category1')
      product = Product.new(:name => nil, :description => 'some description', :image => 'image location', :price_cents => 1, :quantity => 1, :category_id => 2)
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to eq(
        ["Name can't be blank"])
    end

    it "price presence" do
      product = Product.new(:name => 'xbox', :description => 'xbox description', :image => 'xbox image location', :price_cents => nil, :quantity => 1, :category_id => 2)
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Price can't be blank")
    end

    it "quantity presence" do
      product = Product.new(:name => 'playstation', :description => 'playstation description', :image => 'playstation image location', :price_cents => 299, :quantity => nil, :category_id => 2)
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Quantity can't be blank")
    end

    it "category presence" do
      product = Product.new(:name => 'switch', :description => 'switch description', :image => 'switch image location', :price_cents => 399, :quantity => 300, :category_id => nil)
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Category can't be blank")
    end
  end
end