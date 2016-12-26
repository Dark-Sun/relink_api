class String

  def camelize
    self.split('_').collect(&:capitalize).join
  end

end
