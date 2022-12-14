class UsersController < ApplicationController
  def index
    @page, @limit = offset_and_limit

    @users = if filter.nil?
               User.paginate(@page.to_i, @limit.to_i)
             else
               User.filter_by_status(@filter).paginate(@page.to_i, @limit.to_i)
             end

    @pages = User.pages(@limit, @filter)
    respond_to do |format|
      format.html
      format.json { render json: @users }
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def offset_and_limit
    page = params[:page] || 1
    limit = params[:limit] || 20
    [page, limit]
  end

  def filter
    @filter = !params[:filter].nil? && params[:filter].empty? ? nil : params[:filter]
  end
end
