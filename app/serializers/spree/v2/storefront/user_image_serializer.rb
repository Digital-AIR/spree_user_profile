module Spree
  module V2
    module Storefront
      class UserImageSerializer < BaseSerializer
      	include ::Spree::Api::V2::ImageTransformationConcern
        set_type :user_image

        attributes :styles, :alt, :original_url
      end
    end
  end
end