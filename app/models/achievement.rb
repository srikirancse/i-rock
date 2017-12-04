class Achievement < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :user, presence: true
  validates :title, uniqueness: {
      scope: :user_id,
      message: "you can't have two achievements with the same title"
  }
  # validate :unique_title_for_one_user

  enum privacy: %i[public_access private_access friends_access]

  def description_html
    Redcarpet::Markdown.new(Redcarpet::Render::HTML).render(description)
  end

  def self.by_letter(letter)
    includes(:user).where('title LIKE ?', "#{letter}%").order('users.email')
  end

  # def unique_title_for_one_user
  #   existing_achievemnt = Achievement.find_by(title: title)
  #   if existing_achievemnt && existing_achievemnt.user == user
  #     errors.add(:title, "you can't have two achievements with the same title")
  #   end
  # end
end
