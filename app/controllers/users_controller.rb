class UsersController < ApplicationController

  def index
    #keywordが無ければnilを返す
    return nil if params[:keyword] == ""
    # WHERE 列名 LIKE '%検索値%を使用 keywordを含むユーザーを探し@usersへ代入、ただし自分は除く、10人まで
    @users = User.where(['name LIKE ?', "%#{params[:keyword]}%"] ).where.not(id: current_user.id).limit(10)
    respond_to do |format|
      format.html
      format.json
    end
  end

  def edit
  end

  def 
    binding.pry
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end