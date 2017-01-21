require 'rails_helper'

describe UsersController, type: :controller do
  login_user

  describe "GET #index" do
    it "assigns all users as @users" do
      expect(get :index).to render_template(:index)
    end
  end

end
