class SurveyShowSerializer < ActiveModel::Serializer
  attributes :title, :tags, :created_at, :updated_at
end
