class AdminSubmissionsPolicy < Struct.new(:user, :admin_submissions)

  def index?
    user.admin?
  end

  def show?
    user.admin?
  end

  def admin?
    user.admin?
  end
end
