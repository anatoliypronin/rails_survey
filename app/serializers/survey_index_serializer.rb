class SurveyIndexSerializer < ActiveModel::Serializer
  attributes :id, :title, :tags, :created_at, :updated_at
end
