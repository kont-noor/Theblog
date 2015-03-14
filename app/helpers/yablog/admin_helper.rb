module Yablog
  module AdminHelper
    def link_to_item(item)
      link_to "View", path_to_item(item)
    end

    def link_to_edit_item(item)
      link_to "Edit", path_to_edit_item(item)
    end

    def link_to_new_item(model)
      link_to "New Item", path_to_new_item(model)
    end

    def path_to_item(item)
      send("admin_#{model_class(item.class)}_path", item)
    end

    def path_to_edit_item(item)
      send("edit_admin_#{model_class(item.class)}_path", item)
    end

    def path_to_new_item(model)
      send("new_admin_#{model_class(model)}_path")
    end

    def model_class(model)
      model.to_s.underscore.match(/[\w_]+$/)
    end
  end
end
