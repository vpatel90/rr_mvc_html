class UsersController < ApplicationController
  def index
    "all users..."
  end

  def show
    "show"
  end

  def edit
    params[:id]
  end
end
