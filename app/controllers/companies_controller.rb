class CompaniesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_company, only: [:show, :edit, :update, :destroy]
  before_action :admin_user, only: [:edit, :destroy, :update, :create, :new]

  # GET /companies
  # GET /companies.json
  def index
    @companies = Company.includes(:users).search(params[:keyword]).paginate(page: params[:page]).order(name: :asc)
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
  end

  # GET /companies/new
  def new
    @company = Company.new
  end


  # GET /companies/1/edit
  def edit
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(company_params)

    respond_to do |format|
      if @company.save
        format.html { redirect_to @company, notice: 'Company was successfully created.' }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to @company, notice: 'Company was successfully updated.' }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    if @company.employments.empty?
      @company.destroy
      redirect_to companies_path, notice: 'Company was successfully destroyed.'
    else
      redirect_to companies_path, notice: 'You can not delete a company if an WynAlum currently works or has worked there. Please first edit that user\'s profile to remove the position from his/her work history.'
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:name, :street1, :street2, :city, :state, :zip, :description, :website, :hp, :orgtype, :contact_last, :contact_first, :note, :contact_email, :contact_phone, :latitude, :longitude, :full_address)
    end

    def admin_user
      redirect_to root_url unless current_user.admin?
    end


end