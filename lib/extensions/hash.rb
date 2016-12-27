class Hash

  def deep_stringify_keys
    inject({}) do |hash, (key, value)|
      value = value.stringify_keys if value.is_a?(Hash)
      hash[key.to_s] = value
      hash
    end
  end

  def deep_camelize_keys
    inject({}) do |hash, (key, value)|
      value = value.is_a?(Hash) ? value.deep_camelize_keys : value
      hash[key.to_s.camelizify] = value
      hash
    end
  end

end
