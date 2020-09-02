module Flecks
  module RunTask
    def self.call(interval=nil, &block)
      interval ||= 5

      Async do |task|
        while true
          block.()
          task.sleep(interval)
        end
      end
    end
  end
end
