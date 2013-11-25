require "differ/version"

module Differ
  def hash_diff(h1, h2, diff = [])
    diffs = []
    h1.each do |k, v|
      if hash?(v)
        diffs = hash_diff(v, hash?(h2[k]) ? h2[k] : {}, diff << k)
      end
      if !h2.key?(k)
        diffs << diff + [k]
      end 
    end
    diffs
  end

  private

  def hash?(var)
    var.try(:class) == Hash
  end

  def show_path(path)
    puts path.join(' -> ')
  end

end