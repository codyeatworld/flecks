module Flecks
  module SendSMS
    def self.call(page, previous_content, content)
      settings = Settings.build

      twilio_account_sid = settings.get(:twilio_account_sid)
      twilio_auth_token = settings.get(:twilio_auth_token)
      twilio_from_number = settings.get(:twilio_from_number)

      body = Body.(page.url, previous_content, content)

      client = Twilio::REST::Client.new(twilio_account_sid, twilio_auth_token)
      client.messages.create(from: twilio_from_number, to: page.phone_number, body: body)
    end

    module Body
      def self.call(url, previous_content, content)
        body = <<~HTML.strip
          #{url}
          --
          #{Diff.(previous_content, content)}
        HTML
      end
    end

    module Diff
      def self.call(previous_content, content)
        Diffy::Diff.new(previous_content + "\n", content + "\n", context: 2, diff: '-w')
      end
    end
  end
end
