require 'test_helper'

class AdministrationControllerTest < ActionController::TestCase
  test "should get invite_participants" do
    get :invite_participants
    assert_response :success
  end

  test "should get notify_participants" do
    get :notify_participants
    assert_response :success
  end

end
