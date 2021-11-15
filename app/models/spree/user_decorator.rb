module Spree::UserDecorator
  def self.prepended(base)
    base.has_one :image, as: :viewable, dependent: :destroy, class_name: 'Spree::UserImage'
  end
end

Spree.user_class.prepend Spree::UserDecorator
