class UserSession < Authlogic::Session::Base
  remember_me true
  disable_magic_states true
  allow_http_basic_auth false

  def to_key
    new_record? ? nil : [ self.send(self.class.primary_key) ]
  end
end

