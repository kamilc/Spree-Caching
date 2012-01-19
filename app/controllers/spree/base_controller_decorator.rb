Spree::BaseController.class_eval do

  helper_method :add_cache_index

  # Symbol -> String -> IO ()
  def add_cache_index(key, cache_key)
    # it appends cache_key to list retrieved from cache by key
    # if cache doesn't have such key - we create it
    list = Rails.cache.read(to_cache_key(key))
    list = list.nil? ? [] : list.dup
    cache_key = fragment_cache_key(cache_key)
    Rails.cache.write(to_cache_key(key), list.push(cache_key).uniq)
  end

  # Symbol -> Symbol
  def to_cache_key(key)
    ("keys:" + key.to_s).to_sym
  end

end