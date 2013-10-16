module UsersHelper


	def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    link_to (image_tag(gravatar_url, :alt => 'Avatar', class: "img-circle gravatar", style:"height:175px; width:175px;")) , user_path(user)
  end

  # checks to see if the user is the current_user
	def is_current_user(user)
		if user==current_user
			return true
		else
			return false
		end
	end



end
