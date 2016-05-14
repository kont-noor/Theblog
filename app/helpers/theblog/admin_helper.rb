module Theblog
  module AdminHelper
    def formatted_value(item, attribute)
      unless attribute.is_a?(Hash) 
        return raw(item.send(attribute))
      end

      association_name = attribute.keys.first
      association = item.try(association_name)
      return if association.nil?

      if association.respond_to?(:any?)
        raw(association.map { |el| print_association(el, attribute) }.join(', '))
      else
        print_association(association, attribute)
      end
    end

    def print_association(association, attribute)
      association_attribute = attribute.values.first
      title = association.send(association_attribute)

      if attribute[:link]
        link_to title, path_to_item(association)
      else
        raw(title)
      end
    end

    def link_to_item(item)
      link_to "View", path_to_item(item)
    end

    def link_to_update_status(item, action)
      link_to action.to_s.humanize, path_to_update_status(item, action), method: :put
    end

    def path_to_update_status(item, action)
      theblog.send("admin_#{model_class(item.class)}_#{action}_path", item)
    end

    def link_to_edit_item(item)
      link_to "Edit", path_to_edit_item(item)
    end

    def link_to_new_item(model, params = nil)
      link_to "New Item", path_to_new_item(model), params
    end

    def path_to_item(item)
      theblog.send("admin_#{model_class(item.class)}_path", item)
    end

    def path_to_edit_item(item)
      theblog.send("edit_admin_#{model_class(item.class)}_path", item)
    end

    def path_to_new_item(model)
      theblog.send("new_admin_#{model_class(model)}_path")
    end

    def model_class(model)
      model.to_s.underscore.match(/[\w_]+$/)
    end

    def bootstrap_input(form, field)
      parameters = {
        wrapper_html: { class: 'form-group' },
        input_html:   { class: 'form-control' }
      }
      field_name = if field.is_a? Hash
                     parameters[:as] = field.values.first
                     field.keys.first
                   else
                     field
                   end
      form.input field_name, parameters
    end
  end
end
