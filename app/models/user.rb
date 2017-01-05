class User < ActiveRecord::Base

  TEMP_EMAIL_PREFIX = 'change@me'
  TEMP_EMAIL_REGEX = /\Achange@me/

  require 'translit'

  mount_uploader :image, UserUploader

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable
  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :lastseenable

  validates_format_of :email, :without => TEMP_EMAIL_REGEX, on: :update

  def self.find_for_oauth(auth, signed_in_resource = nil)

    # Get the identity and user if they exist
    identity = Identity.find_for_oauth(auth)

    # If a signed_in_resource is provided it always overrides the existing user
    # to prevent the identity being locked with accidentally created accounts.
    # Note that this may leave zombie accounts (with no associated identity) which
    # can be cleaned up at a later date.
    user = signed_in_resource ? signed_in_resource : identity.user

    # Create the user if needed
    if user.nil?

      # Get the existing user by email if the provider gives us a verified email.
      # If no verified email was provided we assign a temporary email and ask the
      # user to verify it on the next step via UsersController.finish_signup
      email_is_verified = auth.info.email && (auth.info.verified || auth.info.verified_email)
      email = auth.info.email if email_is_verified
      user = User.where(:email => email).first if email

      puts "!!!!!"
      puts auth.extra.raw_info
      puts "!!!!!"

      # Create the user if it's a new registration
      if user.nil?
        if !auth.provider.blank? && auth.provider == "vkontakte"
          user = User.new(
            name: auth.extra.raw_info.first_name,
            #photo: auth.info.image,
            photo: auth.extra.raw_info.photo_200_orig,
            name1: auth.extra.raw_info.first_name,
            name2: auth.extra.raw_info.last_name,
            email: "#{auth.extra.raw_info.id}@vk.com",
            password: Devise.friendly_token[0,20],
            confirmed_at: Time.new,
            url: "#{(Translit.convert(auth.extra.raw_info.first_name, :english)).gsub(' ', '')}_#{(Translit.convert(auth.extra.raw_info.last_name, :english)).gsub(' ', '')}"
          )
          #user.skip_confirmation! if user.respond_to?(:skip_confirmation)
          user.save!
        elsif !auth.provider.blank? && auth.provider == "mail_ru"
          user = User.new(
            name: auth.extra.raw_info.nick,
            #photo: auth.info.image,
            photo: auth.extra.raw_info.pic_190,
            name1: auth.extra.raw_info.first_name,
            name2: auth.extra.raw_info.last_name,
            email: auth.extra.raw_info.email,
            password: Devise.friendly_token[0,20],
            confirmed_at: Time.new,
            url: "#{(Translit.convert(auth.extra.raw_info.first_name, :english)).gsub(' ', '')}_#{(Translit.convert(auth.extra.raw_info.last_name, :english)).gsub(' ', '')}"
          )
          #user.skip_confirmation! if user.respond_to?(:skip_confirmation)
          user.save!
        elsif !auth.provider.blank? && auth.provider == "google_oauth2"
          user = User.new(
            name: auth.extra.raw_info.name,
            #photo: auth.info.image,
            photo: auth.extra.raw_info.picture,
            name1: auth.extra.raw_info.family_name,
            name2: auth.extra.raw_info.given_name,
            email: auth.extra.raw_info.email,
            password: Devise.friendly_token[0,20],
            confirmed_at: Time.new,
            url: "#{(Translit.convert(auth.extra.raw_info.family_name, :english)).gsub(' ', '')}_#{(Translit.convert(auth.extra.raw_info.given_name, :english)).gsub(' ', '')}"
          )
          #user.skip_confirmation! if user.respond_to?(:skip_confirmation)
          user.save!
        else
          user = User.new(
            name: auth.extra.raw_info.name,
            #photo: auth.info.image,
            photo: "https://graph.facebook.com/#{identity.uid}/picture?width=9999",
            name1: auth.extra.raw_info.name.split(' ')[1],
            name2: auth.extra.raw_info.name.split(' ')[0],
            #username: auth.info.nickname || auth.uid,
            email: auth.extra.raw_info.email,
            password: Devise.friendly_token[0,20],
            confirmed_at: Time.new,
            url: "#{(Translit.convert(auth.extra.raw_info.name.split(' ')[1], :english)).gsub(' ', '')}_#{(Translit.convert(auth.extra.raw_info.name.split(' ')[0], :english)).gsub(' ', '')}"
          )
          #user.skip_confirmation! if user.respond_to?(:skip_confirmation)
          user.save!
        end
        
      end
    end

    # Associate the identity with the user if needed
    if identity.user != user
      identity.user = user
      identity.save!
    end
    user
  end

  def email_verified?
    self.email && self.email !~ TEMP_EMAIL_REGEX
  end
end
