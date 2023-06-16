# frozen_string_literal: true

class ImagesController < ApplicationController
  layout 'images'

  helper_method :all_images

  def index

  end
  
  def all_images
    @all_images ||= InsalesApi::Image.all
  end
end
