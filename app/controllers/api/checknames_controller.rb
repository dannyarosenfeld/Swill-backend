module Api
  class ChecknamesController < ApplicationController

    def create
    user = User.find_by(access_token: params[:favorite][:accessToken])
      if user
      favorites = []
       user.favorites.each do |favorite|
        favorites << favorite.drink_name
      end
                render json: favorites, status: 200
    end
  end
  end
end
