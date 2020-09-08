module Flecks
  module NotifyDiscord
    def self.call(page, previous_content, content)
      discord_webhook_url = page.discord_webhook_url

      body = Body.(page.url, previous_content, content)

      client = Discordrb::Webhooks::Client.new(url: discord_webhook_url)
      client.execute do |builder|
        builder.content = "@everyone"
        builder.add_embed do |embed|
          embed.title = page.name
          embed.description = <<~FLECKS
            #{body}
          FLECKS
          embed.timestamp = Time.now
        end
      end
    end
  end
end
