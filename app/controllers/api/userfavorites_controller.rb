module Api
  class UserfavoritesController < ApplicationController

    def create


      user = User.find_by(access_token: params[:favorite][:accessToken])

    if user
      p "blablahblahblah"
      p params
      favorites = user.favorites

        return_hash = {}
        name_ary = []
        id_ary = []

      favorites.each do |favorite|
        return_hash[favorite.drink_id] = {id: favorite.drink_id, name: favorite.drink_name}
      end






      render json: return_hash, status: 200
    end

    end

  end
end
