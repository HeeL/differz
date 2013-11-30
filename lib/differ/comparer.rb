module Differ

  class Comparer

    def initialize(file1, file2)
      @file1 = file1
      @file2 = file2
    end

    def show_diff
      get_diffs.each do |diff|
        puts diff.join(' -> ')
      end
      nil
    end

    private

    def get_diffs
      hash_diff(read_yaml(@file1), read_yaml(@file2))
    end

    def read_yaml(file_path)
      YAML.load(File.read(file_path))
    end

    def hash_diff(h1, h2, path = [])
      diff = []
      h1.each do |k, v|
        if hash?(v)
          diff += hash_diff(v, hash?(h2[k]) ? h2[k] : {}, path + [k])
        elsif !h2.key?(k)
          diff << path + [k]
        end
      end
      diff
    end

    def hash?(var)
      var.is_a?(Hash)
    end
  
  end
end
