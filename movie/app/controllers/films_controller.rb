class FilmsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]

  def index
    @films = Film.all
  end

  def new
    @film = Film.new
  end

  def show
    @film = Film.find(params[:id])
  end

  def edit
    @film = Film.find(params[:id])
  end

  def create
    @film = Film.new(film_params)
    @film.user = current_user
    if @film.save
      redirect_to films_path
    else
      render :new
    end
  end

  def update
    @film = Film.find(params[:id])
    if @film.update(film_params)
      redirect_to films_path, notice: "Update Success"
    else
      render :edit
    end
  end

  def destroy
    @film = Film.find(params[:id])
    @film.destroy
    redirect_to films_path, alert: "Film Deleted"
  end

  private
  def film_params
    params.require(:film).permit(:title, :description)
  end
end
