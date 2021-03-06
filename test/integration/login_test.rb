require 'test_helper'

class LoginTest < ActionDispatch::IntegrationTest

  def setup
  	@member = members(:jalal)
  end

  test "invalid_login" do
  	get login_path
  	assert_template 'session/new'
  	post login_path, session: {email: "", password: ""}
  	assert_template 'session/new'
  	assert_not flash.empty?
  	get root_path
  	assert flash.empty?
  end

  test "valid_login" do
    get login_path
    post login_path, session: { email: @member.email, password: 'password' }
    assert_redirected_to @member
    follow_redirect!
    assert_template 'members/show'
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", member_path(@member)
    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to root_url
    delete logout_path # Simulate a user clicking logout in a second window.
    follow_redirect!
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", logout_path,      count: 0
    assert_select "a[href=?]", member_path(@member), count: 0
  end

  test "nil_member_authentication" do
    assert_not @member.authenticated?('remember', '')
  end

  test "login_remember" do
    log_in_as(@member, remember_me: '1')
    assert_not_nil cookies['remember_token']
  end

  test "login_no_remember" do
    log_in_as(@member, remember_me: '0')
    assert_nil cookies['remember_token']
  end
end
