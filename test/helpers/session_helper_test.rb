require 'test_helper'

class SessionHelperTest < ActionView::TestCase

  def setup
    @member = members(:jalal)
    remember(@member)
  end

  test "current_member_on_nil_session" do
    log_in @member
    assert_equal @member, current_member
    assert is_logged_in?
  end

  test "current_member_nil_on_wrong_remember_digest" do
    @member.update_attribute(:remember_digest, Member.digest(Member.new_token))
    assert_nil current_member
  end
end
