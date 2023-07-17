# frozen_string_literal: true

class Event < ApplicationRecord
  
  has_one_attached :image

  attr_accessor :remove_image 
end
