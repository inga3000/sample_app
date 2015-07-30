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

  // attach ajax handling for product comment deletion

  $('a.delete-product-comment').on('ajax:success', function(){
     console.log('Ajax success on comment deletion');

     $(this).parents('.comment-container').remove();
  });

});

