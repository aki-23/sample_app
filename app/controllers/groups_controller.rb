class GroupsController < ApplicationController

  def index
    @groups = Group.all.order("RAND()")
  end

  def search
    @groups = Group.search(params[:keyword]).order("RAND()")
    respond_to do |format|
      format.html
      format.json
    end
  end

  private
  def group_params
    params.permit(:name, :image)
  end

end
