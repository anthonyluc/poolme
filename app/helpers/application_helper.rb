module ApplicationHelper
  def avatar_url
    current_user.facebook_picture_url || "http://placehold.it/30x30"
  end

  def url
    request.path_info
  end
end
