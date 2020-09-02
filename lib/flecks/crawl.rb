module Flecks
  class Crawl
    include Log::Dependency

    def self.call(page)
      instance = new
      instance.(page)
    end

    def call(page)
      store = {}
      page = Page.build(page)

      RunTask.(page.interval) do
        begin
          browser = Ferrum::Browser.new

          browser.goto(page.url)

          content = String.new

          page.xpaths.each do |xpath|
            content += browser.at_xpath(xpath).inner_text
          end

          previous_content = store[page.name]

          store[page.name] = content

          if previous_content.nil?
            logger.info "#{page.name}: First time crawling page"
          end

          if !previous_content.nil? && previous_content != content
            logger.info "#{page.name}: New changes found"
            logger.info "#{page.name}: Sending SMS to #{page.phone}"

            SendSMS.(page, previous_content, content)
          else
            unless previous_content.nil?
              logger.info "#{page.name}: No changes found"
            end
          end
        rescue => error
          logger.error "#{page.name}: #{error.message}"
        ensure
          browser.quit
        end
      end
    end
  end
end
