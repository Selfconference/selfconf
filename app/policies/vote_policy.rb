class VotePolicy < ApplicationPolicy

  def create?
    user.selector?
  end

  def destroy?
    user.selector? && record.user_id == user.id
  end
end
