require "capybara/cucumber"
require "capybara/poltergeist"

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app)
end

Capybara.default_driver = :poltergeist
Capybara.app_host = "http://localhost:9000"
