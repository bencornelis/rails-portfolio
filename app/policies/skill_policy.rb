class SkillPolicy < ApplicationPolicy
  def update?
    user_is_admin?
  end

  def create?
    user_is_admin?
  end

  def destroy?
    user_is_admin?
  end
end
