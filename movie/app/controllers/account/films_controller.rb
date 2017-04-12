class Account::FilmsController < ApplicationController
  before_action :authenticate_user!

  def index
    @films = current_user.marked_films
  end
end
