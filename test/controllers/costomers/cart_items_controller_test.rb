require 'test_helper'

class Costomers::CartItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get costomers_cart_items_show_url
    assert_response :success
  end

end
