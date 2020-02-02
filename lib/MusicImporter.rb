class MusicImporter
    attr_reader :path

    def initialize(path)
      @path = path
    end

    def files()
      files = Dir["#{@path}/*.mp3"]
      files.collect{|file| file.slice!("#{path}/")
      file
    end

    def import
      files.each{|file| Song.create_from_filename(file)}
    end
  end

  module Concerns
    module Findable
      def find_by_name(name)
        all.find{|item| item.name == name}
      end

      def find_or_create_by_name(name)
        item = find_by_name(name)
        if !item
          item = create(name)
        end
        item
      end
    end
  end