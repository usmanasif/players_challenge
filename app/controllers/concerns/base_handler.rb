# frozen_string_literal: true

module BaseHandler
  extend ActiveSupport::Concern

  private

  class_methods do
    def actions(*actions)
      send :public, *actions
    end
  end
end
