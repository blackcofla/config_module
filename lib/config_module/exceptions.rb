module ConfigModule
  class ConfigError < NoMethodError
    def initialize name, object, details = nil
      @name, @object, @details = name, object, details
      @custom_message = "invalid #{identifier} `#{name}' for #{object_info}"
    end
    attr :name, :object, :custom_message, :details

    alias_method :super_message, :message
    alias_method :message, :custom_message

    def object_info
      if object.is_a?(Class) then
        object.name
      else
        "instance of `#{object.class} < #{object.class.superclass}'"
      end
    end
  end

  class InvalidNamespaceError < ConfigError
    def identifier; :namespace; end
  end
end
