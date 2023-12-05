require "test_helper"

class SalariesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get salaries_index_url
    assert_response :success
  end
end
