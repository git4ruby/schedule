require 'test_helper'

class SchedulesControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

end
