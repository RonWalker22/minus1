# users
class User < ApplicationRecord
  include SimpleDiscussion::ForumUser
  attr_encrypted :email, key: [Rails.application.credentials.email[:ENCRYPTION_KEY]].pack("H*")
  blind_index :email, key: [Rails.application.credentials.email[:BLIND_INDEX_KEY]].pack("H*")
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable,
         omniauth_providers: [:steam, :discord]
  has_many :commander_seats,
           class_name: 'Room',
           foreign_key: 'commander_id'
  has_many :commander_teams,
           class_name: 'Team',
           foreign_key: 'commander_id'
  has_many :commander_recipes,
           class_name: 'Recipe',
           foreign_key: 'commander_id'
  has_many :commander_strategies,
           class_name: 'Strategy',
           foreign_key: 'commander_id'
  belongs_to :room, optional: true
  belongs_to :current_objective,
             class_name: 'Objective',
             optional: true
  has_many :user_strategies
  has_many :strategies, through: :user_strategies
  has_many :user_recipes
  has_many :recipes, through: :user_recipes
  has_many :user_teams
  has_many :teams, through: :user_teams
  belongs_to :game_setting, class_name: 'Game', foreign_key: 'game_setting_id'
  validates_uniqueness_of :email, :allow_blank => true, :case_sensitive => false

  def email_required?
    false
  end

  def will_save_change_to_email?
    false
  end

  def self.from_omniauth(auth)
    nickname = auth.info.nickname
    name = auth.info.name

    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.password = Devise.friendly_token[0, 20]
      user.name = if nickname
                    nickname.empty? ? name : nickname
                  else
                    name
                  end
    end
  end

  def self.from_omniauth_discord(auth)
    name = auth.info.name
    uid = auth.uid
    where(provider: auth.provider, uid: uid).first_or_create do |user|
      user.password = Devise.friendly_token[0, 20]
      user.name = name
    end
  end
end
