require 'test_helper'

class TvozesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tvozes_index_url
    assert_response :success
  end

end
