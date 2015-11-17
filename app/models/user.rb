class User < ActiveRecord::Base

  # include PgSearch
  # multisearchable :against => [:first_name, :last_name, :email]

  # include Elasticsearch::Model
  # include Elasticsearch::Model::Callbacks

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :twitter]

  include Taggable

  has_many :talent_applications
  has_many :talents, through: :talent_applications
  has_many :created_projects,
           class_name: 'Project',
           foreign_key: :creator_id

  validates :first_name, :last_name, presence: true

  acts_as_messageable
  
  mount_uploader :avatar, AvatarUploader

  

  def self.from_facebook(auth)
    name_ary = auth.info.name.split
    where(email: auth.info.email).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.first_name = name_ary.first
      user.last_name = name_ary.last
      user.email = auth.info.email
      user.login = auth.info.nickname
      user.password = Devise.friendly_token
      user.image_url = auth.info.image
    end
  end

  def self.new_with_session(params, session)
    data = session['devise.facebook_data']
    super.tap do |user|
      user.email ||= data['email'] if data && data['extra']['raw_info']
    end
  end

  def suitable_talents
    Talent.suitable_for(self)
  end

  def update_with_password(params, *options)
    if from_facebook?
      params.delete(:current_password)
      params.delete(:password)
      params.delete(:password_confirmation)

      result = update_attributes(params, *options)
      clean_up_passwords
      result
    else
      super
    end
  end

  def to_s
    "#{first_name} #{last_name}"
  end

  def from_facebook?
    provider == 'facebook'
  end

  def mailboxer_email(object)
    email
  end

def self.search(search)
  where("first_name LIKE ? OR last_name LIKE ? OR city LIKE ? OR country LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%") 
end


  # settings index: { number_of_shards: 1 } do
  #   mappings dynamic: 'false' do
  #     indexes :first_name, analyzer: 'english'
  #     indexes :last_name, analyzer: 'english'
  #     indexes :email, analyzer: 'english'
  #     indexes :city, analyzer: 'english'
  #   end
  # end

end
