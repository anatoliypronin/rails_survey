class SurveyIndexSerializer < ActiveModel::Serializer
  attributes :id, :title, :tags, :questions, :created_at, :updated_at
end
