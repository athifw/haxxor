module Haxxor
  module Spec
    module FeatureMacros
      def sign_in(user)
        visit '/session/new'
        fill_in 'Email', with: user.email
        fill_in 'Password', with: 'password'
        click_button 'Log in'
      end
    end
  end
end