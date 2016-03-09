require 'test_helper'

class MembersControllerTest < ActionController::TestCase

	def setup 
		@member = members(:jalal)
		@member2 = members(:test)
	end

	test "get_new" do
		get :new
		assert_response :success
	end

	test "redirect_to_edit_on_not_logged_in" do
		get :edit, id: @member
		assert_not flash.empty?
		assert_redirected_to login_url
	end

	test "redirect_to_update_on_not_logged_in" do
		patch :update, id: @member, member: { name: @member.name, email: @member.email }
		assert_not flash.empty?
		assert_redirected_to login_url
	end

	test "redirect_to_edit_on_wrong_user" do
		log_in_as(@member2)
		get :edit, id: @member
		assert_redirected_to root_url
	end

	test "redirect_to_update_on_wrong_user" do
		log_in_as(@member2)
		patch :update, id: @member, member: { name: @member.name, email: @member.email }
		assert_redirected_to root_url
	end

	test "redirect_index_on_not_logged_in" do
		get :index
		assert_redirected_to login_url
	end

	test "should redirect destroy when not logged in" do
		assert_no_difference 'Member.count' do
			delete :destroy, id: @member
		end
		assert_redirected_to login_url
	end

	test "should redirect destroy when logged in as a non-admin" do
		log_in_as(@member2)
		assert_no_difference 'Member.count' do
			delete :destroy, id: @member
		end
		assert_redirected_to root_url
	end
end
