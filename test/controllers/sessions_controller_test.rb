require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create!(email: 'email@example.com', password: 'password', password_confirmation: 'password')
  end

  test 'should get new' do
    get login_url
    assert_response :success
  end

  test 'should create session' do
    post login_url, params: { email: @user.email, password: 'password' }
    if response.redirect?
      assert_response :redirect
    else
      puts response.body
      assert false, "Expected a redirect, but got #{response.status}"
    end
  end

  test 'should destroy session' do
    post login_url, params: { email: @user.email, password: 'password' }
    delete logout_url
    assert_response :redirect
  end
end
