# frozen_string_literal: true

class Pokemon < ApplicationRecord
  scope :paginate, ->(page, per_page) { limit(per_page).offset((page - 1) * per_page) }

  validates :name, presence: true
end
