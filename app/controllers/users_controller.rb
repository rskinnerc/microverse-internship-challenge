class UsersController < ApplicationController
  def index
    page, limit = offset_and_limit
    @pages = User.pages(limit)

    @users = if params[:filter].present?
               User.filter_by_status(params[:filter]).paginate(page.to_i, limit.to_i)
             else
               User.paginate(page.to_i, limit.to_i)
             end

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
end
