class ApplicationController < ActionController::Base
  def home
    render json: { message: "Hello and Welcome to Elastic with Rails" }
  end
end
