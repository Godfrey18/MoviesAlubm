class UsersController < ApplicationController

def new
	@users =User.new
end

def create
@users =User.new(user_params)
if @users.save
	flash[:success] = "Welcome to the Movies Album #{@users.username}"
	redirect_to films_path
else
render 'new'
end

end

private

def user_params

params.require(:user).permit(:username,:email,:password)
end


end