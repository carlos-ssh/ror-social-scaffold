class FriendshipsController < ApplicationController

  def index
    @friends = current_user.friends
    @friend_requests = current_user.friend_requests
  end


  def create
    @friendship = Friendship.new(user_id: params[:user_id], friend_id: params[:friend_id], confirmed: params[:c])

    if friendship.save
      redirect_back(fallback_location: root_path, notice: 'Friend request as been send')
    else
      redirect_back(fallback_location: root_path, notice: 'Unable to send friend request')
    end

  end


  def update
    @friendship = current_user.inverse_frienships.find_by(user_id: params[:id])

    if @friendship
      @friendship.update(confirmed: true)
      redirect_back(fallback_location: )
    else
    end
  end
    
    
  def delete_friend
    @friendship = Friendship.find(params[:id])
    
  end


  def cancel_request
    
  end

  def decline_request
    
  end

end
