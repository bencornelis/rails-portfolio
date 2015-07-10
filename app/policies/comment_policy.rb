class CommentPolicy < ApplicationPolicy
  def create?
    user_signed_in?
  end

  def update?
    record.user == user || user_is_admin?
  end

  def destroy?
    record.user == user || user_is_admin?
  end
end
