class RegistrationsController < Devise::RegistrationsController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_filter :require_no_authentication, only: [:new, :create]

def edit
end

def new
    @cohorts = Cohort.all.order(:name)
  super
    @user = User.new
end

def create
  #render json: sign_up_params
@cohorts = Cohort.all.order(:name)
  @user = User.new(sign_up_params)
  @cohorts = Cohort.all.order(:name)

  respond_to do |format|
    if @user.save
      format.html { redirect_to @user, notice: 'User was successfully created.' }
      format.json { render :show, status: :created, location: @user }
    else
      format.html { render :new }
      format.json { render json: @user.errors, status: :unprocessable_entity }
    end
  end
end

def update
  respond_to do |format|
    if @users.update(company_params)
      format.html { redirect_to @users, notice: 'User was successfully updated.' }
      format.json { render :show, status: :ok, location: @users }
    else
      format.html { render :edit }
      format.json { render json: @users.errors, status: :unprocessable_entity }
    end
  end
end


  private

   def sign_up_params
     params.require(:user).permit(:fname, :lname, :email, :password, :password_confirmation, :cohort_id)
   end

   def account_update_params
     params.require(:user).permit(:fname, :lname, :email, :password, :password_confirmation, :current_password)
   end

   def admin_user
      redirect_to root_url unless current_user.admin
   end

   def set_user
     @users = User.find(params[:id])
   end


end
