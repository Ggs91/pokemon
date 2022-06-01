# frozen_string_literal: true

module ExceptionsHelper
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do |exception|
      render json: "Record not found", status: :not_found
    end

    rescue_from ActiveRecord::RecordInvalid do |exception|
      render json: "Record Invalid", status: :unprocessable_entity
    end

    rescue_from ActionController::ParameterMissing do |exception|
      render json: "Parameter missing", status: :bad_request
    end
  end
end
