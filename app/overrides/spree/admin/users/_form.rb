Deface::Override.new(
  virtual_path: 'spree/admin/users/_form',
  name: 'Add user first name and last name in user form',
  insert_before: 'div[data-hook="admin_user_form_roles"]',
  text: <<-HTML
          <%= f.field_container :first_name, class: ['form-group'] do %>
          <%= f.label :first_name, Spree.t(:first_name) %>
          <%= f.text_field :first_name, class: 'form-control' %>
          <%= f.error_message_on :first_name %>
          <% end %>

          <%= f.field_container :last_name, class: ['form-group'] do %>
          <%= f.label :last_name, Spree.t(:last_name) %>
          <%= f.text_field :last_name, class: 'form-control' %>
          <%= f.error_message_on :last_name %>
          <% end %>
        HTML

)


Deface::Override.new(
  virtual_path: 'spree/admin/users/_form',
  name: 'Add user image in user form',
  insert_bottom: 'div[data-hook="admin_user_form_password_fields"]',
  text: <<-HTML
          <%= f.field_container :image do %>
          <%= f.label :image %>
          <%= f.file_field :image %><br><br>
          <%= image_tag main_app.url_for(@user.image.url(:small)) if @user.image %>
          <% end %>
        HTML

)