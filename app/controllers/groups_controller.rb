class GroupsController < ApplicationController

  def index
  end

  def new
    # @groupに空のインスタンスを代入
    # 空であることからrailsがcreateを実行と判断？
    @group = Group.new
    @group.users << current_user
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_path, notice: 'グループを作成しました'
    else
      render :new
    end
  end
  
  def edit
    # ActiveRecordメソッド  
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to root_path, notice: 'グループを更新しました'
    else
      render :edit
    end
  end

  private
  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end

end
