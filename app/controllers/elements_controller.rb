module ElementsController
  def self.included(base)
    base.class_eval do
      expose :elements, model: model
      expose :element, attributes: :element_params, model: model
      expose :model, model: model
      # walkaround to "The action 'create' could not be found for Controller", Rails bug?
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