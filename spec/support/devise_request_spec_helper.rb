module DeviseRequestSpecHelpers
  include Warden::Test::Helpers
  def self.inlcuded(base)
    base.before(:each) { Warden.test_mode! }
    base.after(:each) { Warden.test_reset! }
  end

  def sign_in(resource)
    login_as(resource, scope: warden_scope(resource))
  end

  private

  def warden_scope(resource)
    resource.class.name.underscore.to_sym
  end
end
