class RegistrationController <Devise::RegistrationsController

	protected
	def after_sign_up_path_for(resource)
		register_1_path
	end
end
