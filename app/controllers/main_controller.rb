class MainController < ApplicationController
  helper_method :delivery_variants

  def index
   # @delivery_variants ||= InsalesApi::DeliveryVariant.all
  end

  def delivery_variants
    @delivery_variants ||= InsalesApi::DeliveryVariant.all

    @delivery_variants.each do |variant|
      Rails.logger.info "#{variant.title}"
    end
  end
end
