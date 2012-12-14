class ConsentController < ApplicationController
  
  # GET /consent/1/new
  def new
    @user = User.find(params[:id])
  end

  # GET /consent/1/check
  def check
    @user = User.find(params[:id])
    if @user.consented_at.nil?
      render "new"
    else
      redirect_to :controller=>'home', :action => 'show', :id => @user.id
    end
  end

# PUT /consent/1
  def update     
      if params[:commit] == 'I agree'
          User.update(params[:id], :consented_at=>DateTime.now)
          #redirect_to home_index_url
          redirect_to :controller=>'home', :action => 'show', :id => params[:id]
      else
         params[:commit] == 'No thanks'
          render "nothanks"
      end
  end
end
