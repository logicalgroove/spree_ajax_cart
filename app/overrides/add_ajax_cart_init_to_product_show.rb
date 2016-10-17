# Deface::Override.new({
# 	virtual_path: 'spree/products/show',
# 	name: 'add_ajax_to_cart_form',
# 	insert_after: '[data-hook="product_show"]',
# 	# partial: 'spree/orders/ajax_script'
# 	text: '
# 		%script
# 			Spree.AjaxCart.Form();
# 	'
# 	})