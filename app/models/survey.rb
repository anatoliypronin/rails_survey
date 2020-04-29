class Survey < ApplicationRecord
  has_many :tag_surveys, dependent: :destroy
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
    self.tags.map(&:title).join(", ")
  end
  
  def all_tags=(title)
    self.tags = title.split(',').map do |t|
      title = Tag.find(t)
      Tag.where(title: title.title).first!
    end
  end
end
