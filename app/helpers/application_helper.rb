# todo: improve and publish as gem
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
    html = { 'ng-model':"element.#{attribute}" }
    html = html.merge(ng_validations @object, attribute)
    input attribute, input_html: html
  end
end