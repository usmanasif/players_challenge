FactoryBot.define do
  factory(:device) do
    modelname { Faker::Device.model_name }
    operating_system { 'ios' }
    os_version { Faker::App.semantic_version }
    locale { 'en_US' }
    player
  end
end
