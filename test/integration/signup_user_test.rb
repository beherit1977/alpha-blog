require 'test_helper'

class SignupUserTest < ActionDispatch::IntegrationTest

  test "should signup a new user" do
    get signup_path
    assert_template 'users/new'
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, user: {username: "john", email: "ku@mail.ru",
                        password: "password"}
    end
    assert_template 'users/show'
    assert_match "john", response.body
  end
end