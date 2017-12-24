module ApplicationHelper
	def admin?
		current_user == User.first
	end

	def authorize
    unless admin?
      flash[:error] = "unauthorized access"
      redirect_to home_path
      false
    end
  end
end
