class HomeController < ApplicationController

  def show
    #redirect_to :controller=>'landing', :action => 'index'
    @user = User.find(params[:id])
  end
end
