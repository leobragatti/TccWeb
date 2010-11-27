var cartOriginalHtml = "";

$(document).ready(function() {
    if ($('.amount-items-in-cart').length > 0) {

        adminCart();

        var cartAmountInCartListener = new Vtex.JSEvents.Listener('cartAmountInCartListener', adminCart);
        checkoutEventDispatcher.addListener(checkoutChangedEventName, cartAmountInCartListener);

    }
});

function adminCart() {
    cartOriginalHtml = $('.amount-items-in-cart')[0].outerHTML;
    cartAmountItems();
    cartAmountProducts();
    cartAmountKits();
    cartTotal();

}

function cartAmountItems() {
    if ($('.amount-items-em').length > 0) {
        var url = '/no-cache/cartamountitems'
        ajaxRequestCart('POST', url, null, '.amount-items-em', '');
    }
}

function cartAmountProducts() {

    if ($('.amount-products-em').length > 0) {
        var url = '/no-cache/cartamountproducts'
        ajaxRequestCart('POST', url, null, '.amount-products-em', '');
    }
}

function cartAmountKits() {

    if ($('.amount-kits-em').length > 0) {
        var url = '/no-cache/cartamountkit'
        ajaxRequestCart('POST', url, null, '.amount-kits-em', '');
    }
}

function cartTotal() {

    if ($('.total-cart-em').length > 0) {
        var url = '/no-cache/cartamounttotal'
        ajaxRequestCart('POST', url, null, '.total-cart-em', '');
    }
}

function cartHasApplicationException(dataResult) {
    var re = /\<applicationExceptionObject\>(.*?)\<\/applicationExceptionObject\>/i;
    var returnMessage = re.exec(dataResult);
    if (returnMessage != null && returnMessage != 'undefined' && returnMessage != '' && returnMessage.length > 0) {
        if (returnMessage[1] != 'undefined' && returnMessage[1] != '') {

            return returnMessage[1];
        }
    } else {

        return '';
    }
}

function ajaxRequestCart(method, url, postData, target, callback) {
    $.ajax({
        type: method,
        url: url,
        data: postData,
        success: function (dataResult) {
            if (target != null && target != '') {
                $(target).html('');
                var error = cartHasApplicationException(dataResult)
                
                if (error != '') {
                    $(target).html(error);
                } else {
                    $(target).html(dataResult);
                }
            }
            if (callback != null && callback != '')
                callback();

        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {

            $(target).html('Erro ao buscar a informação!');

        }
    });
}

