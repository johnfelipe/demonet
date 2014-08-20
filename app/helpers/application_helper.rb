module ApplicationHelper

  def format_meeting_name(meeting)
    "#{t(:meeting).humanize} #{meeting.groups.join(',')} #{l(Date.parse(meeting.date.to_s))}"
  end

  # def format_group_names(groups)
  #   groups.join(',')
  # end

end
