require 'test_helper'

class MemberSignupTest < ActionDispatch::IntegrationTest

  def setup
    ActionMailer::Base.deliveries.clear
  end

  test "valid signup information" do
    get signup_path
    assert_difference 'Member.count', 1 do
      post_via_redirect members_path, member: 
      { 
        name:  "Example Member",
        email: "member@example.com",
        password:              "password",
        password_confirmation: "password" 
      }
    end
    assert_template 'members/show'
  end

  test "valid signup information with account activation" do
    get signup_path
    assert_difference 'Member.count', 1 do
      post members_path, member: 
      { 
        name:  "Example User",
        email: "user@example.com",
        password:              "password",
        password_confirmation: "password" 
      }
    end
    assert_equal 1, ActionMailer::Base.deliveries.size
    member = assigns(:member)
    assert_not member.activated?
    # Try to log in before activation.
    log_in_as(member)
    assert_not is_logged_in?
    # Invalid activation token
    get edit_account_activation_path("invalid token")
    assert_not is_logged_in?
    # Valid token, wrong email
    get edit_account_activation_path(member.activation_token, email: 'wrong')
    assert_not is_logged_in?
    # Valid activation token
    get edit_account_activation_path(member.activation_token, email: member.email)
    assert member.reload.activated?
    follow_redirect!
    assert_template 'members/show'
    assert is_logged_in?
  end
end