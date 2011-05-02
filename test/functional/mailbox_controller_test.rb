require 'test_helper'

class MailboxControllerTest < ActionController::TestCase
  test "should get show" do
    get :show
    assert_response :success
  end

end
