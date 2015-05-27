json.(element, :id, :name)
json.subgroups element.subgroups, partial: 'subgroups/element', as: :element
