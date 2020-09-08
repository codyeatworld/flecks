module Flecks
  module Body
    def self.call(url, previous_content, content)
      body = <<~HTML.strip
        #{url}
        --
        #{Diff.(previous_content, content)}
      HTML
    end
  end
end
