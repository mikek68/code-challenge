module ControllerMacros
  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryGirl.create(:user, password: 'test123', password_confirmation: 'test123')
      sign_in user
    end
  end
end
