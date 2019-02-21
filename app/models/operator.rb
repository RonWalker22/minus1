# users
class Operator < ApplicationRecord
  rolify
  acts_as_favoritor
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
  has_many :operator_rooms
  has_many :rooms, through: :operator_rooms
  has_many :operator_strategies
  has_many :strategies, through: :operator_strategies
  has_many :operator_recipes
  has_many :recipes, through: :operator_recipes
  has_many :operator_teams
  has_many :teams, through: :operator_teams
  validates :name, uniqueness: { case_sensitive: false }
  belongs_to :game_setting, class_name: 'Game', foreign_key: 'game_setting_id'

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
