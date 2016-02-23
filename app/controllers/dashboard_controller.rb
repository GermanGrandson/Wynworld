class DashboardController < ApplicationController
  before_filter :authenticate_user!

  def index

    if current_user.admin == false
      @cohort_users = current_user.cohort.users
    end

    @users =  User.where(admin: false)

    @map_data = [ ["Google","somedude",37.3860517,-122.0838511],["Google","somedude",37.3860517,-122.0838511] ]

    # Code below is used for map
    @employments = Employment.where(current: true)  # Find all current employments

    @array_with_one = []
    @array_with_multiple = []

    @employments.each do |e|
      if @array_with_one.include? e.company.id
        if !@array_with_multiple.include? e.company.id
           @array_with_multiple << e.company.id
         end
      else
        @array_with_one << e.company.id
      end
    end

    @array_with_one = @array_with_one - @array_with_multiple

    @single_companies_full_array = []
    @array_with_one.each do | single_employer |
      who_there = ""
      @map1_array = []
      Employment.where(company_id: single_employer).where(current: true).each do |x|
          who_there << x.user.fname << " " << x.user.lname
          @map1_array[0] = x.company.name
          @map1_array[1] = who_there
          @map1_array[2] = x.company.latitude
          @map1_array[3] = x.company.longitude
      end
      @single_companies_full_array << @map1_array
    end

    @multiple_companies_full_array = []
    @array_with_multiple.each do | multi_employer |
      who_there = ""
      @map2_array = []
      Employment.where(company_id: multi_employer).where(current: true).each do |x|
          who_there << x.user.fname << " " << x.user.lname << ", "
          @map2_array[0] = x.company.name
          @map2_array[1] = who_there[0...-2]
          @map2_array[2] = x.company.latitude
          @map2_array[3] = x.company.longitude
      end
      @multiple_companies_full_array << @map2_array
    end



  end
end
