class UsersController < ApplicationController

def index
@users = User.paginate(page: params[:page], per_page: 5)
end

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

def edit

@users = User.find(params[:id])

end

def update

@users = User.find(params[:id])

if @users.update(user_params)

flash[:success] = "Your account was updated successfully"

redirect_to films_path

else

render 'edit'

end

end

def show

@users = User.find(params[:id])
@user_articles = @users.films.paginate(page: params[:page], per_page: 5)

end

private

def user_params

params.require(:user).permit(:username,:email,:password)
end


end