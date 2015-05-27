json.(element, :id, :name)
json.groups element.groups, partial: 'groups/element', as: :element
