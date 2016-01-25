class AdminSubmissionsPolicy < Struct.new(:user, :admin_submissions)

  def index?
    user.admin?
  end
end
