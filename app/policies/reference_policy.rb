class ReferencePolicy < ApplicationPolicy

  def new?
    user_signed_in?
  end

  def create?
    user_signed_in?
  end
end
