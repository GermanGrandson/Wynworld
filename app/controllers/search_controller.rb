class SearchController < ApplicationController

  def index
  end

  def results

    # use a named variable called query_term for term
    query_term = params[:q].downcase



    #conduct the search
    if !query_term.blank?
      @user = User.where("lower(fname) like ? or lower(lname) like ?", "%#{query_term}%", "%#{query_term}%")
      # account for no results
      if @user.empty?
        @user = nil
      end
    end

    respond_to do |format|
            format.html { render plain: "This is HTML" }
            format.js
            format.json { render json: @user }
        end

  end

end
