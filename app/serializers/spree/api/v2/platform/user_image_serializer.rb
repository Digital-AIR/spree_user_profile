module Spree
  module Api
	module V2
	  module Platform
	    class UserImageSerializer < BaseSerializer
	      include ::Spree::Api::V2::ImageTransformationConcern
	      set_type :user_image

	      attributes :styles, :alt, :original_url
	    end
	  end
	end
  end
end