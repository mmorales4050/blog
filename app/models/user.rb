class User < ActiveRecord::Base
  @@current_user = nil

  def self.current_user
    @@current_user
  end

  def login
    self.class.current_user = self
  end
end
