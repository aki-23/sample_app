class GroupsController < ApplicationController
  before_action :set_group, only: [:edit, :update]

  def index
    @groups = Group.all.order("RAND()")
    group = Group.includes(:user) 
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def search
    @groups = Group.includes(:tags).search(params[:keyword]).order("RAND()")
    respond_to do |format|
      format.html
      format.json
    end
  end

  private
  def group_params
    params.require(:group).permit(:name, :image, tag_ids:[])
  end

  def set_group
    @group = Group.find(params[:id])
  end

end
