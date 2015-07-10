class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def user_signed_in?
    user != nil
  end

  def user_is_admin?
    user_signed_in? && user.admin?
  end
end
