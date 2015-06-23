require "capybara/cucumber"
require "capybara/poltergeist"
require "vanilli/server"
require "vanilli/client"

server = VanilliServer.new(port: 9001)
server.start
at_exit { server.stop }

vanilli = VanilliClient.new(9001)

track_stub = vanilli.on_get("/tracks")
track_stub.respond_with(200, {
  content_type: "application/json",
  body: {
    tracks: [
      { id: 1, name: "Track One" },
      { id: 2, name: "Track Two" },
      { id: 3, name: "Track Three" }
    ]
  }
})
vanilli.stub(track_stub)

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app)
end

Capybara.default_driver = :poltergeist
Capybara.app_host = "http://localhost:9000"

After do
  vanilli.verify
  vanilli.clear
end
