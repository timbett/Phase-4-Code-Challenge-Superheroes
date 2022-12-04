class PowersController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :rescue_from_error
rescue_from ActiveRecord::RecordInvalid, with: :invalid
    def index
        powers=Power.all
        render json: powers
    end
    def show
        powers=Power.find(params[:id])
        render json: powers 
    end
    def update
        powers=Power.find(params[:id])
       powers.update!(allow)
        render json: powers
    end
    private
    def rescue_from_error
        render json:{error: "Power not found"}, status: :not_found
    end
    def allow
        params.permit(:description)
    end
    def invalid(invalid)
        render json: {errors:invalid.record.errors.full_messages}, status: :unprocessable_entity
    end
end
