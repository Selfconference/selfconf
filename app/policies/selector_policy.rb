class SelectorPolicy < Struct.new(:user, :selector)
  def selector?
    user.selector?
  end
end
