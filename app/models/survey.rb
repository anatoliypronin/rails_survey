class Survey < ApplicationRecord
  has_many :tag_surveys
  has_many :tags, through: :tag_surveys
  has_many :questions, dependent: :destroy
  belongs_to :user
  validates :title, presence: true
  state_machine initial: :active do
    state :active
    state :deleted

    event :del do
      transition active: :deleted
    end

    event :restore do
      transition deleted: :active
    end
  end
  def all_tags
    self.tags.map(&:title)
  end
  def all_tags=(title)
    self.tags = title.split(',').map do |title|
      title = Tag.find(title)
      Tag.where(title: title.title).first_or_create!
    end
  end
end
