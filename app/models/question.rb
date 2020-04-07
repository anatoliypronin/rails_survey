class Question < ApplicationRecord
  validates :title, presence: true
  validates :position, presence: true
  validates :question_kind, presence: true
  validates :question_kind, inclusion: { in: %w(CheckBox RadioButton Input) }
  #validates :survey_id, presence: true
end
