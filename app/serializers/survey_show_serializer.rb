class SurveyShowSerializer < ActiveModel::Serializer
  attributes :title, :tags, :created_at, :updated_at

  has_many :questions, include: :all
end
