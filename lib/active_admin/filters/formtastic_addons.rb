module ActiveAdmin
  module Filters
    module FormtasticAddons

      #
      # The below are Formtastic overrides to use `base` instead of `class` for MetaSearch.
      #

      # Returns the default label for a given attribute. Uses ActiveModel I18n if available.
      def humanized_method_name
        if object.base.respond_to?(:human_attribute_name)
          object.base.human_attribute_name(method)
        else
          method.to_s.send(builder.label_str_method)
        end
      end

      # Returns the association reflection for the method if it exists
      def reflection_for(method)
        @object.base.reflect_on_association(method) if @object.base.respond_to?(:reflect_on_association)
      end

      # Returns the column for an attribute on the object being searched if it exists.
      def column_for(method)
        @object.base.columns_hash[method.to_s] if @object.base.respond_to?(:columns_hash)
      end
    end
  end
end
