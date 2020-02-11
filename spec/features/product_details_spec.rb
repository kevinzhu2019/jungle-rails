require 'rails_helper'

RSpec.feature "Visitor navigates to product detail page", type: :feature, js: true do
  
  # setup DB to display testing data, same codes as home_page_spec
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

  scenario "They see the product details" do
    # ACT
    visit root_path

    # DEBUG / VERIFY
    click_on 'Details'
    save_screenshot
    expect(page).to have_css 'article.product-detail'
  end
end
