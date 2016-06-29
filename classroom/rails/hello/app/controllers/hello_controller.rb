class HelloController < ApplicationController
  def index
    @name = params[:name]
  end

  def hello
     @user = User.find(params[:id])
  end
end
