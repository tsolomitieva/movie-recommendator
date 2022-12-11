class Admin::UsersController < AdminController
    before_action :authenticate_user!
   
    
    def index
        @users = User.all
    end 

    def ban_account
        ban_user = User.find(params[:id])
        if ban_user.user?
           ban_user.toggle!(:ban)
        end
    end

end
