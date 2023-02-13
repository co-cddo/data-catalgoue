# frozen_string_literal: true

class Source < ApplicationRecord
  has_many :data_services

  validates :name, :url, presence: true
  validates :url, uniqueness: true
end
