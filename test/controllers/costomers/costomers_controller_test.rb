require 'test_helper'

class Costomers::CostomersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get costomers_costomers_show_url
    assert_response :success
  end

  test "should get edit" do
    get costomers_costomers_edit_url
    assert_response :success
  end

  test "should get new" do
    get costomers_costomers_new_url
    assert_response :success
  end

end
