module Api
class FavoritesController < ApplicationController

  def create
    user = User.find_by(access_token: params[:favorite][:accessToken])
    if user
      user.favorites.create(drink_id: params[:favorite][:drink_id], drink_name: params[:favorite][:drink_name] )
                render :text => "successful", status: 200
    end
  end



end
end
