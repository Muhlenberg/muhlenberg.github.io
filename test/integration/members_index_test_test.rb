require 'test_helper'

class MembersIndexTestTest < ActionDispatch::IntegrationTest
	def setup
		@member    = members(:jalal)
		@admin     = members(:jalal)
		@non_admin = members(:test)
	end

	test "index including pagination" do
		log_in_as(@member)
		get members_path
		assert_template 'members/index'
		assert_select 'div.pagination'
		Member.paginate(page: 1).each do |member|
			assert_select 'a[href=?]', member_path(member), text: "Profile"
		end
	end

	test "index as admin including pagination and delete links" do
		log_in_as(@admin)
		get members_path
		assert_template 'members/index'
		assert_select 'div.pagination'
		first_page_of_members = Member.paginate(page: 1)
		first_page_of_members.each do |member|
			assert_select 'a[href=?]', member_path(member), text: "Profile"
			unless member == @admin
				assert_select 'a[href=?]', member_path(member), text: 'delete'
			end
		end
		assert_difference 'Member.count', -1 do
			delete member_path(@non_admin)
		end
	end

	test "index as non-admin" do
		log_in_as(@non_admin)
		get members_path
		assert_select 'a', text: 'delete', count: 0
	end
end
