class AdminSubmissionPolicy < Struct.new(:user, :admin_submission)

  def index?
    user.selector?
  end
end
