Deface::Override.new(:virtual_path => "taxons/show",
                    :name => "taxon_products_list_caching_override",
                    :surround => "[data-hook='taxon_products']",
                    :partial => "shared/product_list_caching",
                    :disabled => false)