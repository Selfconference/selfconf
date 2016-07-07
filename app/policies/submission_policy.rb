class SubmissionPolicy < ApplicationPolicy

  def index?
    user.selector?
  end

  def show?
    user.admin? || record.users.include?(user)
  end

  def update?
    user == record.user
  end

  def destroy?
    user == record.user
  end
end
