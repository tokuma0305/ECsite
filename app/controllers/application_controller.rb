class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    def after_sign_in_path_for(resource)
        case resource
        when Admin
            admin_homes_top_path
        when EndUser
            end_users_path
        end
    end
    def after_sign_out_path_for(resource)
        if resource == :end_user
            root_path
        elsif resource == :admin
            new_admin_session_path
        else
            root_path
        end
    end
    protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:katakana_lastname])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:katakana_firstname])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:lastname])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:zipcode])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:address])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:phone_number])
    end
end
