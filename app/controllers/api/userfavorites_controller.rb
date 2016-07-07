module Api
  class UserfavoritesController < ApplicationController
    skip_before_filter  :verify_authenticity_token
    def create
      p params
      p "*"*50
      p request.body.read
      p "_"*50
      user = User.find_by(access_token: params[:favorite][:accessToken])

    if user
      favorites = user.favorites

        return_hash = {
          favorites:{}
        }
        name_ary = []
        id_ary = []

      favorites.each do |favorite|
        return_hash[:favorites][favorite.drink_id] = {id: favorite.drink_id, name: favorite.drink_name}
      end

      return_hash[:username] = user.name

      render json: return_hash, status: 200
    end

    end

  end
end
