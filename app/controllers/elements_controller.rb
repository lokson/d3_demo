module ElementsController
  def self.included(base)
    base.class_eval do
      def self.model; @model end

      expose :elements, model: model
      expose :element, attributes: :element_params, model: model
      expose :model, model: model
      # below line seems to be a walkaround to possible Rails bug
      # "The action 'create' could not be found for Controller"
      def create; super end
    end
  end

  def create
    element.save!
    render partial:'element'
  end

  def update
    element.save!
    render partial:'element'
  end

  def destroy
    element.destroy!
    head 200
  end

  def param_key
    model.model_name.param_key
  end
end