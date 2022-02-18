# frozen_string_literal: true

module BaseHandler
  extend ActiveSupport::Concern

  private

  def model
    controller_name.camelize.singularize.constantize
  end

  def relation; end

  class_methods do
    def actions(*actions)
      send :public, *actions
    end
  end
end
