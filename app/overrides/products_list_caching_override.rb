Deface::Override.new(:virtual_path => "products/index",
                    :name => "products_list_caching_override",
                    :surround => "[data-hook='homepage_products']",
                    :partial => "shared/product_list_caching",
                    :disabled => false)

Deface::Override.new(:virtual_path => "home/index",
                    :name => "home_products_list_caching_override",
                    :surround => "[data-hook='homepage_products']",
                    :partial => "shared/product_list_caching",
                    :disabled => false)