module UsersHelper


	def gravatar_for(user)
	    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
	    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
	    link_to (image_tag(gravatar_url, :alt => 'Avatar', class: "img-circle gravatar", style:"height:175px; width:175px;")) , user_path(user)
 	 end

  # checks to see if the user is the current_user
	def is_current_user(user)
		user==current_user ? true : false
	end

	def default_picture(user)
		link_to (image_tag("MaleShadow.jpg", :alt => 'Avatar', class: "img-circle", style:"height:175px; width:175px; border: 2px solid black; z-index: 1;")) , user_path(user)
	end


end
