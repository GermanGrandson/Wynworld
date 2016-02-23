class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_user, only: [:edit, :update, :destroy, :show]
  before_action :admin_user, only: [:edit, :update, :destroy, :new, :create]


  def index
    # @users = User.paginate(page: params[:page])
    sort_by = params[:sort_by]

    if !params[:company].nil?
      company = Company.find params[:company]
      employments = company.employments.where(current: true)
      users_array = []
      employments.each do |e|
        users_array << e.user
      end

        @users = users_array
      #@users = users_array.where(admin: false).order(sort_by).includes(:companies).search(params[:keyword]).filter(params[:filter]).paginate(page: params[:page]).order(fname: :asc)
    else
      @users = User.where(admin: false).order(sort_by).includes(:companies).search(params[:keyword]).filter(params[:filter]).paginate(page: params[:page]).order(fname: :asc)
    end

  end

  def show
    @employments = @user.employments.order(:start_date).reverse_order
  end

  def new
    @user = User.new
  end

  def create
    respond_to do |format|
      if @users.update(user_params)
        format.html { redirect_to @users, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @users }
      else
        format.html { render :edit }
        format.json { render json: @users.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
          params[:user].delete(:password)
          params[:user].delete(:password_confirmation)
      end
          if @user.update(user_params)
            format.html { redirect_to @user, alert: 'Profile was successfully updated.' }
            format.json { render :show, status: :ok, location: @user }
          else
            format.html { render :edit }
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
    end
  end

  def destroy
      if @user.destroy
        redirect_to user_index_path, alert: 'User was successfully deleted'
      end
  end




  private

  def user_params
    params.require(:user).permit(:fname, :lname, :email, :location, :picurl, :seeking, :reason, :slack, :github, :linkedin, :portfolio, :avatar, :avatar_cache, :avatar_url, :remove_avatar, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def admin_user
    redirect_to root_url unless current_user.admin || @user == current_user
  end


end
