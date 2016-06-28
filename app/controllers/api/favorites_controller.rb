module Api
class FavoritesController < ApplicationController
  def create
    p params

    user = User.find_by(access_token: params[:favorite][:accessToken])
    if user
      user.favorites.create(drink_id: params[:favorite][:drink_id])
                render :text => "successful", status: 200

    end
  end

end
end
