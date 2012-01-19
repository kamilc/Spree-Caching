class ProductObserver < ActiveRecord::Observer
  include ExpireFragmentKeys
  include ActionController::Caching::Fragments

  observe Product # This sweeper is going to keep an eye on the Product model
 
  # If our sweeper detects that a Product was created call this
  def after_create(product)
    expire_cache_for(product)
  end
 
  # If our sweeper detects that a Product was updated call this
  def after_update(product)
    expire_cache_for(product)
  end
 
  # If our sweeper detects that a Product was deleted call this
  def after_destroy(product)
    expire_cache_for(product)
  end
 
  private
  def expire_cache_for(product)
 
    # Expire fragments
    expire_fragment_keys(:products)
  end
end