module SpreeUserProfile
  module UserSerializerDecorator
    def self.prepended(base)
      base.attributes :first_name, :last_name
      base.has_one :image, serializer: :user_image
    end
  end
end
	
Spree::V2::Storefront::UserSerializer.prepend(SpreeUserProfile::UserSerializerDecorator)