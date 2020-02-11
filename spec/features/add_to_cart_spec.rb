require 'rails_helper'

RSpec.feature "User can add products to shopping cart", type: :feature, js: true do
  
  # setup DB to display testing data, same codes as home_page_spec and product_detail
  before :each do
    @category = Category.create! name: 'Apparel'

    1.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see the shopping cart increase by 1 after click add to cart button" do
    # ACT
    visit root_path

    # DEBUG / VERIFY
    click_on 'Add'
    save_screenshot
    expect(page).to have_css('li.test-shopping-cart')
    expect(page).to have_content('My Cart (1)')
  end
end
