module UsersHelper
  def set_avatar
  　　if current_user.avatar?
  　　  current_user.avatar.url
  　　else
  　　  '/images/default_avatar.png'
  　　end
  end
  def complete_profile
    if current_user.avatar.blank? 
    　'To complete your profile, go to Edit Profile.'
    end
  end
end
