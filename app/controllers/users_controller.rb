class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    #render 
    # respond_to do |format|
    #   #format.html # show.html.erb
    #   format.json { render json: @user }
    # end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end
  
  # GET /users/1/consentcheck
  def consentcheck
    @user = User.find(params[:id])
    if @user.consented_at.nil?
      render "consent"
    else
      #render "/home/index"
      redirect_to :controller=>'home', :action => 'show', :id => @user.id
    end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        #format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.html { redirect_to user_url(@user), notice: 'User was successfully created.' }    #need user_url(@user) to be able to pass flash notice  
        
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])
    
    if params[:commit] == 'I agree'
        User.update(@user.id, :consented_at=>DateTime.now)
        #redirect_to home_index_url
        redirect_to :controller=>'home', :action => 'show', :id => @user.id

    elsif params[:commit] == 'No thanks'
        render "nothanks"
    else

        respond_to do |format|
          if @user.update_attributes(params[:user])
            format.html { redirect_to @user, notice: 'User was successfully updated.' }
            format.json { head :no_content }
          else
            format.html { render action: "edit" }
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
        end
    end  
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end