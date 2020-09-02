module Flecks
  class Page
    include Schema::DataStructure

    attribute :url, String
    attribute :name, String
    attribute :interval, Integer
    attribute :xpaths, Array
    attribute :phone_number, String
  end
end
