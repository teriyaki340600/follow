class RelationshipsController < ApplicationController
  #before_action :set_user

  def create
    user = User.find(params[:follow_id])
    following = current_user.follow(user)
    if following.save
      flash[:notice] = 'ユーザーをフォローしました'
      redirect_to request.referer
    else
      flash.now[:alert] = 'ユーザーのフォローに失敗しました'
      redirect_to user
    end
  end

  def destroy
    user = User.find(params[:follow_id])
    following = current_user.unfollow(user)
    if following.destroy
      flash[:notice] = 'ユーザーのフォローを解除しました'
      redirect_to request.referer
    else
      flash.now[:alert] = 'ユーザーのフォロー解除に失敗しました'
      redirect_to user
    end
  end
end
