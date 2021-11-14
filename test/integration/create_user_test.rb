require "test_helper"

class CreateNewUserTest < ActionDispatch::IntegrationTest

  test "create new user" do
    get "/signup"
    assert_response :success
    assert_difference 'User.count', 1 do
    post users_path, params: { user: { username: "Username", email: "user@example.com", password: "password"}}
      assert_response :redirect 
    end
    follow_redirect!
    assert_response :success
    assert_match "Listing all articles", response.body
  end

  
end