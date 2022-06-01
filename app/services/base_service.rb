# frozen_string_literal: true

class BaseService
  include ResponseHelper

  def self.call(...)
    service = new(...)

    service.call

    service.response
  end

  def initialize
    raise NotImplementedError, "Must be implemented"
  end

  def call
    raise NotImplementedError, "Must be implemented"
  end
end
