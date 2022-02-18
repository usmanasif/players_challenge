module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordInvalid do |_e|
      render json: { message: 'Record is not valid.' }, status: 422
    end

    rescue_from ActiveRecord::RecordNotFound do |_e|
      render json: { message: 'Record not found.' }, status: 404
    end
  end
end
