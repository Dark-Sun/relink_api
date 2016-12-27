class String

  def camelizify(lower=true)
    self.split('_').map.with_index do |val, index|
      val = val.capitalize if index > 0 && lower
      val
    end.join
  end

end
