class ProjectPolicy < ApplicationPolicy
  def update?
    user_is_admin?
  end

  def create?
    user_is_admin?
  end
end
