class HeroesController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :rescue_from_not_found
    def index
        heroes=Hero.all
        render json: heroes
    end
    def show
        heroes=Hero.find(params[:id])
        render json: heroes, include: ["powers"]
    end
    private
    def rescue_from_not_found
        render json:{error: "Hero not found"}, status: :not_found
    end
end
