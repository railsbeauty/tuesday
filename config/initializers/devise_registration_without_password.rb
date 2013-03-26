# config/initializers/devise_registration_without_password.rb
module Devise
  module Models
    module Validatable
      def password_required?
        false
      end
    end
  end
end