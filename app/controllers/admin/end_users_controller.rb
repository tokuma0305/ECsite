class Admin::EndUsersController < ApplicationController
	def index
		@end_user = EndUser.all
	end
end
