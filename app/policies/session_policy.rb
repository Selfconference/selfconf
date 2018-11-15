class SessionPolicy < ApplicationPolicy
  def index?
    speaker.selector?
  end

  def show?
    speaker.admin? || record.speakers.include?(speaker)
  end

  def update?
    record.speakers.include?(speaker)
  end

  def destroy?
    record.speakers.include?(speaker)
  end
end
