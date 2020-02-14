
class FilmsController < ApplicationController

before_action :set_id, only: [:edit,:update,:show,:destroy]

	def index
		
		@films= Film.all
	end


	def new
		
		@films =Film.new
	end

	def edit

	end

	def create
		@films =Film.new(add_params)
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

		flash[:danger] = "Article was successfully deleted"

		redirect_to films_path

		end

	private

	def set_id
		@films=Film.find(params[:id])
	end

	def add_params
		params.require(:film).permit(:name,:genere,:langauge)
	end
	end