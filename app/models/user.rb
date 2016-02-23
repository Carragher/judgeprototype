class User < ActiveRecord::Base

    attr_accessor :password

   # EMAIL_REGEX = /[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}/i
    validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
   # validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
    validates :password, :confirmation => true #password_confirmation attr

    validates_length_of :password, :in => 6..20, :on => :create

  before_save :encrypt_password
  after_save :clear_password

    ROLES = %w[student judge admin]
    def role?(base_role)
      ROLES.index(base_role.to_s) <= ROLES.index(role)
    end

  def encrypt_password
      if password.present?
          require 'digest/sha1'
          self.encrypted_password = Digest::SHA1.hexdigest(password)
      end
  end

  def clear_password
      self.password = nil
  end

    def self.authenticate(username="", login_password="")


        user = User.find_by_username(username)

        if user && user.match_password(login_password)
            return user
        else
            return false
        end
    end
    def match_password(login_password="")

        self.encrypted_password == Digest::SHA1.hexdigest(login_password)
    end






end
