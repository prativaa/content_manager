require "content_manager/engine"

module ContentManager
  # Your code goes here...
  mattr_accessor :application_controller_class

  def self.application_controller_class
    @@application_controller_class.constantize
  end
end
