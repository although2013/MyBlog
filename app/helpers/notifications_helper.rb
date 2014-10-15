module NotificationsHelper
  def find_receivers(comment_content)
    comment_content.to_s.gsub(/(?<=@)\w+\b/).to_a.uniq
  end

  def unread_notifications_count
    if login?
      current_user.notifications.unread.count
    end
  end
end
