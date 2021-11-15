module Spree
  module Api
    module V2
      module Storefront
        module Account
          class ProfileController < ::Spree::Api::V2::BaseController
          	include Spree::Api::V2::CollectionOptionsHelpers
          	include Spree::BaseHelper

          	before_action :require_spree_current_user

          	def create
              spree_authorize! :update, Spree::user_class

              if params[:image]
			         spree_current_user.create_image(attachment: params.delete(:image))
			         render_serialized_payload { {"data":  spree_current_user} }
              else
                render_error_payload("Image not found")
      			  end
            end

          end
        end
      end
    end
  end
end