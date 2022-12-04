class HeroPowersController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :not_accepted
    def create
        hero_powers=HeroPower.create!(hero_power_params)
        if hero_powers
            hero=Hero.find(params[:hero_id])
            render json: hero, include: ["powers"]
        end
    end
    private
    def hero_power_params
        params.permit(:strength, :power_id, :hero_id)
    end

    def not_accepted(invalid)
        render json:{error: invalid.record.errors}, status: :unprocessable_entity
    end
end
