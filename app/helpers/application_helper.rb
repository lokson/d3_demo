module ApplicationHelper
  def ng_validations(model, attribute)
    result = {}
    model._validators[attribute].each do |validator|
      case validator
        when ActiveRecord::Validations::PresenceValidator
          result['ng-required'] = 'true'
      end
    end
    result
  end
end

class ActionView::Helpers::FormBuilder
  include ApplicationHelper

  def ng_input(attribute)
    model = @object.class
    input attribute, input_html: { 'ng-model':"#{model.name.camelize(:lower)}.#{attribute}" }.merge(ng_validations model, attribute)
  end
end