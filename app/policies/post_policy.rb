class PostPolicy < ApplicationPolicy
  def create?
    user_is_admin?
  end

  def update?
    user_is_admin?
  end

  def destroy?
    user_is_admin?
  end

  def edit?
    user_is_admin?
  end
end
