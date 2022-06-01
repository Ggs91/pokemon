# frozen_string_literal: true

module BooleanCastingHelper
  extend ActiveSupport::Concern

  included do
    def to_bool(raw_value)
      if raw_value.respond_to?(:downcase)
        ActiveRecord::Type::Boolean.new.deserialize(raw_value&.downcase)
      else
        raw_value
      end
    end
  end
end
