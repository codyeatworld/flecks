module Flecks
  module Diff
    def self.call(previous_content, content)
      Diffy::Diff.new(previous_content + "\n", content + "\n", context: 100, diff: '-w')
    end
  end
end
