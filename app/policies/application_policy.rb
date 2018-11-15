class ApplicationPolicy
  attr_reader :speaker, :record

  def initialize(speaker, record)
    @speaker = speaker
    @record = record
  end

  def index?
    false
  end

  def show?
    scope.where(id: record.id).exists?
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  def scope
    Pundit.policy_scope!(speaker, record.class)
  end

  class Scope
    attr_reader :speaker, :scope

    def initialize(speaker, scope)
      @speaker = speaker
      @scope = scope
    end

    def resolve
      scope
    end
  end
end
