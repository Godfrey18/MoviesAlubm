
class FilmsController < ApplicationController

before_action :set_id, only: [:edit,:update,:show,:destroy]

	def index
		
		@films= Film.paginate(page: params[:page], per_page: 5)

	end


	def new
		
		@films =Film.new
	end

	def edit

	end

	def create
		@films =Film.new(add_params)
		@films.user = User.first
		if @films.save
			flash[:success]= "Fil Created Sucesfully"
		redirect_to film_path(@films)
		else
		render :new
		end
	end

	def update
		if @films.update(add_params)
		flash[:success] = "Film was successfully updated"
		redirect_to film_path(@films)
		else
		render 'edit'
		end
	end

	def show
	      
	end

	def destroy

		@films.destroy

		flash[:danger] = "Film was successfully deleted"

		redirect_to films_path

		end

		
	


	private

	def set_id
		@films=Film.find(params[:id])
	end

	def add_params
		params.require(:film).permit(:name,:genere,:langauge,:cast,:director,:release_date)
	end
	end