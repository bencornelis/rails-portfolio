class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def convert_time(seconds)
    time_elapsed = seconds.to_i
    if time_elapsed < 60
      time_unit = "seconds"
    elsif time_elapsed < 60*60
      time_unit = "minutes"
      time_elapsed = (time_elapsed/60).to_i
    elsif time_elapsed < 60*60*24
      time_unit = "hours"
      time_elapsed = (time_elapsed/60*60).to_i
    elsif time_elapsed < 60*60*24*7
      time_unit = "days"
      time_elapsed = (time_elapsed/60*60*24).to_i
    end
    time_unit.chop! if time_elapsed == 1
    "#{time_elapsed} #{time_unit}"
  end

  helper_method :convert_time

  private
  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to root_path
  end
end
