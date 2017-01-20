class UsersController < ApplicationController
  before_action :authenticate_user!

  # GET /users
  def index
  end
end
