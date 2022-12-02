class Admin::UsersController < AdminController
    def index
        @users = User.all
    end 

    def ban_account(ban_user)
        if(ban_user.user?)
            ban_user.ban = true
            ban_user.save!
        end
    end

end
