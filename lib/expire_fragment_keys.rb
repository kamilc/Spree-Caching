module ExpireFragmentKeys

  # Symbol -> IO ()
  def expire_fragment_keys(key)
    list = Rails.cache.read(to_cache_key(key))
    list.each { |cache_key| observer_expire_fragment_keys(cache_key) }
  end

  # Symbol -> Symbol
  def to_cache_key(key)
    ("keys:" + key.to_s).to_sym
  end

  def observer_expire_fragment_keys(key)
    #key = fragment_cache_key(key)
    Rails.cache.delete(key)
  end

end