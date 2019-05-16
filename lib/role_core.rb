# frozen_string_literal: true

require "role_core/engine"

require "options_model"
require "role_core/permission"
require "role_core/mapper"
require "role_core/permission_set"
require "role_core/computed_permissions"

require "role_core/concerns/models/role"

module RoleCore
  class << self
    def permission_set_class
      @permission_set_class ||= PermissionSet.derive "Global"
    end

    def permission_set_class=(klass)
      raise ArgumentError, "#{klass} should be sub-class of #{PermissionSet}." unless klass && klass < PermissionSet

      @permission_set_class = klass.derive "Global"
    end

    def permission_class
      @permission_class ||= Permission
    end

    def permission_class=(klass)
      raise ArgumentError, "#{klass} should be sub-class of #{Permission}." unless klass && klass < Permission

      @permission_class = klass
    end
  end
end
