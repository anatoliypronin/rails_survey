class QuestionIndexSerializer < ActiveModel::Serializer
  attributes :id, :title, :variants, :kind
end
