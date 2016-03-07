module SessionHelper
	# logs member in
	def log_in(member)
		session[:member_id] = member.id
	end

	# returns currently logged in member, if any. remembers after browser close. expires in 20 years
	def current_member
		if (member_id = session[:member_id])
			@current_member ||= Member.find_by(id: member_id)
		elsif (member_id = cookies.signed[:member_id])
			member = Member.find_by(id: member_id)
			if member && member.authenticated?(cookies[:remember_token])
				log_in member
				@current_member = member
			end
		end
	end

	# checks if member is currently logged in
	def logged_in?
		!current_member.nil?
	end

	def log_out
		forget(current_member)
		session.delete(:member_id)
		@current_member = nil
	end

	def remember(member)
		member.remember
		cookies.permanent.signed[:member_id] = member.id
		cookies.permanent[:remember_token] = member.remember_token
	end

	def forget(member)
		member.forget
		cookies.delete(:member_id)
		cookies.delete(:remember_token)
	end
end
