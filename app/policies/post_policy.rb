class PostPolicy < ApplicationPolicy
  def create?
    user_is_admin?
  end

  def update?
    user_is_admin?
  end
end
