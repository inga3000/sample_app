$(document).ready(function(){


	$(".fancybox").fancybox();


	$('#product-form-submit-button').on('click', function() {

      var $product_name = $('#product_name');
      var name = $product_name.val().trim();
      if (name === '') {
        $product_name.focus();
        swal({
          title: 'Name Error',
          text: 'You need to give a name',
          type: 'error'
        }); 

        return false;     
      }

      return true;

	});

});

