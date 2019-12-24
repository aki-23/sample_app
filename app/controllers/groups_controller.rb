class GroupsController < ApplicationController
  before_action :set_group, only: [:edit, :update]
  # before_action :move_to_index

  def index
    if user_signed_in?
    else
      redirect_to root_path
    end
    # @groups = Group.all.order("RAND()")
    # @groups = Group.all
    # group = Group.includes(:user)
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to grouplist_groups_path
    else
      render :new
    end
  end

  def show
    if user_signed_in?
      @groups = Group.all.order('rank IS NULL,rank ASC')
      group = Group.includes(:user) 
    else
      redirect_to root_path
    end
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to grouplist_groups_path
    else
      render :edit
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to grouplist_groups_path
  end

  def search
    @groups = Group.includes(:tags).search(params[:keyword]).order("RAND()")
    respond_to do |format|
      format.html
      format.json
    end
  end

  def grouplist
    if user_signed_in?
      @groups = Group.all
      group = Group.includes(:user) 
    else
      redirect_to root_path
    end
  end

  def grouprank
    if user_signed_in?
      @groups = Group.where.not(rank: nil).order(rank: :asc)
      group = Group.includes(:user) 
    else
      redirect_to root_path
    end
  end

  private
  def group_params
    params.require(:group).permit(:name, :image, :rank, tag_ids: [])
  end

  def set_group
    @group = Group.find(params[:id])
  end

  # def move_to_index
  #   redirect_to root_path unless user_signed_in?
  # end

end
