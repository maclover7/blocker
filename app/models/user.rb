class User < ActiveRecord::Base

  # Omniauth stuff
  def self.from_omniauth(auth, signed_in_resource=nil)
    user = User.where(provider: auth.provider, uid: auth.uid).first
    unless user
      user = User.create(
        provider: auth.provider,
        uid:      auth.uid,
        name:     auth.info.name)
      end
    user
  end
end
