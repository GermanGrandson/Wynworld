class CohortController < ApplicationController
  before_action :set_cohort, only: [:show, :edit, :update, :destroy]
  before_action :admin_user, only: [:edit, :update, :destroy, :new, :create]


  def new
    @cohort = Cohort.new
  end

  def index
    @cohorts = Cohort.all
    @cohorts.order!(name: :desc)
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @cohort.update(cohort_params)
        format.html { redirect_to @cohort, notice: 'Cohort was successfully updated.' }
        format.json { render :show, status: :ok, location: @cohort}
      else
        format.html { render :edit }
        format.json { render json: @cohort.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if @cohort.destroy
      redirect_to cohort_index_path, notice: 'Company was successfully destroyed.'
    end
  end

  def create
    @cohort = Cohort.new(cohort_params)

    respond_to do |format|
      if @cohort.save
        format.html { redirect_to @cohort, notice: 'cohort was successfully created.' }
        format.json { render :show, status: :created, location: @cohort }
      else
        format.html { render :new }
        format.json { render json: @cohort.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_cohort
    @cohort = Cohort.find(params[:id])
  end

  def admin_user
    redirect_to root_url unless current_user.admin?
  end

  def cohort_params
    params.require(:cohort).permit(:name,:location, :graddate)
  end


end
