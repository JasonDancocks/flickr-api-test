class StaticPagesController < ApplicationController
  def index
  	@user_id = params[:user_id]
  end
end
