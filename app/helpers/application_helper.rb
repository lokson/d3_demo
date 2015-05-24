# todo improve and go open source
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

# todo delete
SimpleForm::FormBuilder

# todo refactor into own NgFormBuilder
class ActionView::Helpers::FormBuilder
  include ApplicationHelper

  # todo :ng_model as a possible key
  # calls input with defaults
  # f.input ... input_html: { 'ng-model':'attribute_name' }
  # if field has validations, they will be added
  # f.input ... input_html: { 'ng-model':'attribute_name', 'ng-required':'true' }
  def ng_input(attribute_name, options = {}, &block)
    options[:input_html] ||= {}
    options[:input_html]['ng-model'] ||="element.#{attribute_name}"
    options[:input_html] = ng_validations(@object, attribute_name).merge! options[:input_html]
    input(attribute_name, options, &block)
  end

  # calls association with defaults
  # f.association ... input_html: { 'ng-model':"element.#{association}_id" }
  # if field has validations, they will be added
  # f.association ... input_html: { 'ng-model':"element.#{association}_id", 'ng-required':'true' }
  def ng_association(association, options = {}, &block)
    options[:input_html] ||= {}
    options[:input_html]['ng-model'] ||= "element.#{association}_id"
    options[:input_html] = ng_validations(@object, association).merge! options[:input_html]
    association(association, options, &block)
  end
end