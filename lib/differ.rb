require "differ/version"

module Differ

  def hash_diff(h1, h2, path = {})
    h1.each do |k, v|
      if hash?(v)
        hash_diff(v, hash?(h2[k]) ? h2[k] : {}, path.merge!(k => ''))
      elsif !h2.key?(k)
        show_hash(path.merge(k => ''))
      end
    end
  end

  private

  def hash?(var)
    var.is_a?(Hash)
  end

  def show_hash(hash, str = '')
    key = hash.keys.first
    next_hash = hash[key]
    if hash?(next_hash)
      str += show_hash(next_hash, str)
    end
    str.present? ? "#{key} -> #{str}" : "#{key}: "
  end

end
