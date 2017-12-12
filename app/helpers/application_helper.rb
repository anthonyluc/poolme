module ApplicationHelper
  def url
    request.path_info
  end

  def avatar_path(user)
    if user.respond_to?(:facebook_picture_url) && user.facebook_picture_url != nil
      image_path facebook_picture_url
    elsif user.photos.first != nil
      cl_image_path user.photos.first.path
    else
      image_path 'avatar.png'
    end
  end
end
