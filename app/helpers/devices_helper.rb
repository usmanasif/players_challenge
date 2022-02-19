# frozen_string_literal: true

module DevicesHelper
  def os_options_for_select
    options_for_select(Device::OPERATING_SYSTEMS.collect { |v| [v.upcase, v] })
  end
end
