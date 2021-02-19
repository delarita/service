require "test_helper"

class SalonsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get salons_index_url
    assert_response :success
  end
end
