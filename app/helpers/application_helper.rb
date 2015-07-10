module ApplicationHelper
  def convert_time(seconds)
    time_elapsed = seconds.to_i
    if time_elapsed < 60
      time_unit = "seconds"
    elsif time_elapsed < 60*60
      time_unit = "minutes"
      time_elapsed = (time_elapsed/60).to_i
    elsif time_elapsed < 60*60*24
      time_unit = "hours"
      time_elapsed = (time_elapsed/(60*60)).to_i
    elsif time_elapsed < 60*60*24*7
      time_unit = "days"
      time_elapsed = (time_elapsed/(60*60*24)).to_i
    end
    time_unit.chop! if time_elapsed == 1
    "#{time_elapsed} #{time_unit}"
  end
end
