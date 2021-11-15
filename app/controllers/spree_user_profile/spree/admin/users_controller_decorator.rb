module SpreeUserProfile::Spree::Admin::UsersControllerDecorator
  def create
    @user = Spree.user_class.new(user_params.except(:image))
    if @user.save
      if permitted_resource_params[:image]
        @user.create_image(attachment: permitted_resource_params.delete(:image))
      end
      flash[:success] = flash_message_for(@user, :successfully_created)
      redirect_to spree.edit_admin_user_path(@user)
    else
      render :new
    end
  end


  def update
 	if permitted_resource_params[:image]
      @user.create_image(attachment: permitted_resource_params.delete(:image))
    end

    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end

    if @user.update(user_params)
      flash[:success] = Spree.t(:account_updated)
      redirect_to spree.edit_admin_user_path(@user)
    else
      render :edit
    end
  end

end

Spree::Admin::UsersController.prepend SpreeUserProfile::Spree::Admin::UsersControllerDecorator