module Concerns
  module Findable
    def find_by_name(name)
      all.find {|thing| thing.name == name}
    end

    def find_or_create_by_name(name)
      thing = find_by_name(name)
      if !thing 
        thing = create(name)
      end
      thing
    end
  end
end