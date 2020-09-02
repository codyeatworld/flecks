module Flecks
  module Start
    def self.call
      settings = Settings.build
      pages = settings.get(:pages)

      Print.()

      Async do
        pages.each do |page|
          Crawl.(page)
        end
      end
    end

    module Print
      def self.call
        settings = Settings.build
        pages = settings.get(:pages).map do |page|
          Page.build(page)
        end

        puts <<~FLECKS
          █████▒██▓    ▓█████  ▄████▄   ██ ▄█▀  ██████ 
          ▓██   ▒▓██▒    ▓█   ▀ ▒██▀ ▀█   ██▄█▒ ▒██    ▒ 
          ▒████ ░▒██░    ▒███   ▒▓█    ▄ ▓███▄░ ░ ▓██▄   
          ░▓█▒  ░▒██░    ▒▓█  ▄ ▒▓▓▄ ▄██▒▓██ █▄   ▒   ██▒
          ░▒█░   ░██████▒░▒████▒▒ ▓███▀ ░▒██▒ █▄▒██████▒▒
            ▒ ░   ░ ▒░▓  ░░░ ▒░ ░░ ░▒ ▒  ░▒ ▒▒ ▓▒▒ ▒▓▒ ▒ ░
            ░     ░ ░ ▒  ░ ░ ░  ░  ░  ▒   ░ ░▒ ▒░░ ░▒  ░ ░
            ░ ░     ░ ░      ░   ░        ░ ░░ ░ ░  ░  ░  
                      ░  ░   ░  ░░ ░      ░  ░         ░  
                                ░            
        FLECKS
        puts "- - -"
        pages.each do |page|
          puts "#{page.name}:"
          puts "\tURL: #{page.url}"
          puts "\tPhone number: #{page.phone_number}"
          puts "\tInterval: #{page.interval}"
          puts 
        end
      end
    end
  end
end
