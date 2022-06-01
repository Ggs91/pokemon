# frozen_string_literal: true

require 'ostruct'

module ResponseHelper
  extend ActiveSupport::Concern

  included do
    def response
      @response ||= OpenStruct.new(success: true, error: nil)
    end

    def fail!(error = nil)
      response.error = error if error.present?

      response.success = false
    end

    def succeed!
      response.success = true
    end
  end
end
