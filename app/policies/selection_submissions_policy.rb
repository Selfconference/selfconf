class SelectionSubmissionsPolicy < Struct.new(:user, :selection_submissions)

  def index?
    user.selector?
  end
end
