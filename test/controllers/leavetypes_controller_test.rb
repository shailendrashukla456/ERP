require "test_helper"

class LeavetypesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get leavetypes_index_url
    assert_response :success
  end
end
