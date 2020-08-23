class Public::EndUsersController < ApplicationController
    def show
    	@end_user = current_end_user
    end
    def destroy
    end
    def edit
    	@end_user = current_end_user
    end
    def update
    	@end_user = current_end_user
    	@end_user.update(end_user_params)
    	redirect_to end_users_path
    end
    def confirm
    end
    def deleted
    	@end_user = current_end_user
    	@end_user.update(is_deleted: true)
    	reset_session
    	redirect_to root_path
    end
private
def end_user_params
	params.require(:end_user).permit(:katakana_lastname, :katakana_firstname, :lastname, :firstname, :email, :address, :phone_number)
end
end