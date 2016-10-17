class Cart
	constructor: (template)->
		@instance = $('<div style="display:none;" id="ajax-cart"> <a id="close"> X </a> <div id="cart-wrap"> ' + template + ' </div> </div> ')

		@instance.find('a#close').click =>
			@close()

		$('header').append @instance
		@open()

	close: =>
		@instance.fadeOut()

	open: =>
		@instance.fadeIn()

	replace: (template)=>
		@instance.find('#cart-wrap').html(template)
		@open()



Spree.AjaxCart =
	Display: (template)->
		if @Cart
			@Cart.replace(template)
		else 
			@Cart = new Cart(template)

		return
		
	Form: ->
		init = ->
			$('#cart-form form').submit (e)->
				
				form = $(@)

				$.ajax
					type: 'POST'
					dataType: 'script'
					url: form.attr('action')
					data: form.serialize()

				e.preventDefault()
				return false;

		Spree.ready init
		return
