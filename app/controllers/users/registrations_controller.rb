class Users::RegistrationsController < Devise::RegistrationsController

  def after_sign_up_path_for(resource)
    edit_profile_path(current_user)
  end

  def after_inactive_sign_up_path_for(resource)
    edit_profile_path(current_user) # Or :prefix_to_your_route
  end
end
