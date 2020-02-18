class UsersController < ApplicationController

before_action :set_user,only: [:show,:update,:edit]
before_action :require_same_user, only: [:edit, :update,:destroy]
before_action :require_admin, only: [:destroy]

def index
@users = User.paginate(page: params[:page], per_page: 5)
end

def new
	@users =User.new
end

def create
@users =User.new(user_params)
if @users.save
	session[:user_id] = @users.id
	flash[:success] = "Welcome to the Movies Album #{@users.username}"
	redirect_to user_path(@users)
else
	
render 'new'
end

end

def edit

end

def update



if @users.update(user_params)

flash[:success] = "Your account was updated successfully"

redirect_to films_path

else

render 'edit'

end

end

def show


@user_articles = @users.films.paginate(page: params[:page], per_page: 5)

end

def destroy

@users = User.find(params[:id])

@users.destroy

flash[:danger] = "User and all articles created by user have been deleted"

redirect_to users_path

end

private

def user_params

params.require(:user).permit(:username,:email,:password)
end

def set_user

@users = User.find(params[:id])

end

def require_same_user

if current_user != @users and  !current_user.admin?

flash[:danger] = "You can only edit your own account"

redirect_to root_path

end

end

def require_admin

if logged_in? and !current_user.admin?

flash[:danger] = "Only admin users can perform that action"

redirect_to root_path

end

end
end