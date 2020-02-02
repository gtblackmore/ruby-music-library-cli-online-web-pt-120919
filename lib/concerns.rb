module Concerns
  module Findable
    def find_by_name(name)
      all.find {|i| i.name == name}
    end

    def find_or_create_by_name(name)
      i = find_by_name(name)
      if !i
        i = create(name)
      end
      i
    end
  end
end