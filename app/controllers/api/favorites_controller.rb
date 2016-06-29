module Api
class FavoritesController < ApplicationController

  def create
    user = User.find_by(access_token: params[:favorite][:accessToken])
    if user
      user.favorites.create(drink_id: params[:favorite][:drink_id], drink_name: params[:favorite][:drink_name] )
      favorites = []
       user.favorites.each do |favorite|
        favorites << favorite.drink_name
      end
                render json: favorites, status: 200
    end
  end

  def destroy
    user = User.find_by(access_token: params[:favorite][:accessToken])
     if user
        favorite = user.favorites.where(drink_id: params[:favorite][:drink_id])
        user.favorites.destroy(favorite)
        render text: "favorite deleted", status: 200
      else
        render text: "Something went wrong", status: 422
      end
  end


end
end
