module ApplicationHelper
  def han(model, attribute)
    model.to_s.classify.constantize.human_attribute_name(attribute)
  end

  def hsn(model, state, value)
    model.to_s.classify.constantize.send "human_#{state}_name", value
  end

  def hsen(model, state, value)
    model.to_s.classify.constantize.send "human_#{state}_event_name", value
  end
end
