class UsersController < ApplicationController

before_action :set_user,only: [:show,:update,:edit]
before_action :require_same_user, only: [:edit, :update]

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

private

def user_params

params.require(:user).permit(:username,:email,:password)
end

def set_user

@users = User.find(params[:id])

end

def require_same_user

if current_user != @users

flash[:danger] = "You can only edit your own account"

redirect_to root_path

end

end
end