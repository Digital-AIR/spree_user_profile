module Spree
  module Api
    module V2
      module Storefront
        module AccountControllerDecorator
          def destroy
	        spree_authorize! :destroy, Spree::user_class

	        if spree_current_user.destroy
	          render_serialized_payload { {"data": "Account has been deleted successfully"  } }
			else
			  render_error_payload(spree_current_user.errors)
			end
		  end
	    end
	  end
	end
  end
end
	
Spree::Api::V2::Storefront::AccountController.prepend Spree::Api::V2::Storefront::AccountControllerDecorator
