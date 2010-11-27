var buyButtonAsynchronousOriginalHtml = "";
var productIdInCart = "";
var urlCart = "";
var isGoToCart = "";
var concatena = "";

$(document).ready(function () {

    //botão comprar comum da vitrine 
    if ($('.buy-button-normal').length > 0) {
        buyButtonNormalOnButtomOkClick();
    }

    //botão comprar assíncrono da vitrine
    if ($('.buy-button-asynchronous').length > 0) {

        //avisa ao evento do carrinho que vai haver uma inclusão de itens nele
        //var buyButtonAssyncronousListener = new Vtex.JSEvents.Listener('buyButtonAssyncronousListener', buyButtonAsynchronousOnButtomOkClick);
        //checkoutEventDispatcher.addListener(checkoutChangedEventName, buyButtonAssyncronousListener);

        buyButtonAsynchronousOnButtomOkClick();
    }

    $('.remove-href').removeAttr("href");

});

function buyButtonNormalOnButtomOkClick() {
    $('.buy-button-normal').click(function () {

        //pega o id Produto
        productIdInCart = $(this).attr('id');

        //pega a quantidade
        amountInCart = $('.aic' + productIdInCart).attr("value");

        //pega o valor máximo que o cliente pode comprar desse sku
        amountMaxInCart = $('.amount-max-in-cart').attr("value");

        //monta a frase de quantidade máxima
        amountMaxInCartMessage = $('.amount-max-in-cart-message').attr("value").replace("#quantidade#", amountMaxInCart).replace("do item #produto#", "desse item");

        //pega a url
        urlCart = $('.buy-button-normal-a' + productIdInCart).attr("href");

        //ve pra qual tela está indo
        isGoToCart = $('.buy-button-normal-go-to-cart-' + productIdInCart).attr("value");

        if (isGoToCart == "product")
            concatena = "?";
        else
            concatena = "&";

        if (amountInCart.length == 0) {
            amountInCart = "1";
        }

        //verifica se informou na quantidade mais do que pode
        if (amountInCart > amountMaxInCart) {
            alert(amountMaxInCartMessage);
            //$('.buy-button-normal-a' + productIdInCart).attr("href", urlCart + concatena + 'quantidade=' + amountMaxInCart);
        }
        else
        //concatena com a url
            $('.buy-button-normal-a' + productIdInCart).attr("href", urlCart + concatena + 'quantidade=' + amountInCart);

    });
}


function buyButtonAsynchronousOnButtomOkClick() {
    $('.btn-add-buy-button-asynchronous').click(function () {

        //pega o id Produto
        productIdInCart = $(this).attr('id');
        productIdInCart = productIdInCart.replace("idprod", "");
        //tem um id no nome porque o parametro id nao pode ser somente um numero.

        //pega a quantidade
        amountInCart = $('.aic' + productIdInCart).attr("value");

        if (!IsNumeric(amountInCart)) {

            alert("Por favor informe uma quantidade válida!");
            $('.aic' + productIdInCart).attr("value", '1');

        }
        else {

            //pega o valor máximo que o cliente pode comprar desse sku
            amountMaxInCart = $('.amount-max-in-cart').attr("value");

            //monta a frase de quantidade máxima
            amountMaxInCartMessage = $('.amount-max-in-cart-message').attr("value").replace("#quantidade#", amountMaxInCart).replace("do item #produto#", "desse item");

            //pega a url
            urlCart = $('.buy-button-asynchronous-product-url-' + productIdInCart).attr("value").replace("[idSku]", productIdInCart);

            //ve pra qual tela está indo
            isGoToCart = $('.buy-button-asynchronous-go-to-cart-' + productIdInCart).attr("value");

            if (isGoToCart == "product")
                concatena = "?";
            else
                concatena = "&";

            if (amountInCart.length == 0) {
                amountInCart = "1";
            }

            if (!IsNumeric(amountInCart)) {
                amountInCart = "1";
            }

            //verifica se informou na quantidade mais do que pode
            if (parseInt(amountInCart) > parseInt(amountMaxInCart)) {
                alert(amountMaxInCartMessage);
                if (urlCart.indexOf("[quantidade]") > 0) {
                    urlCart = urlCart.replace("[quantidade]", amountMaxInCart);
                }
                else {
                    urlCart = urlCart + concatena + 'quantidade=' + amountMaxInCart;
                }
            }
            else {

                if (urlCart.indexOf("[quantidade]") > 0) {
                    urlCart = urlCart.replace("[quantidade]", amountInCart);
                }
                else {
                    urlCart = urlCart + concatena + 'quantidade=' + amountInCart;
                }
            }


            if (isGoToCart == "cart") {
                //monta o post
                var dataToPost = { productId: productIdInCart, amount: amountInCart };

                //pega a class que será modificada
                var target = '.message-user' + productIdInCart;

                //envia o post
                ajaxRequestbuyButtonAsynchronous('GET', urlCart, dataToPost, target, '');

                //muda o css do botão para clicado
                $(this).addClass('btn-clicked');

                $('.aic' + productIdInCart).attr("value", "1");

                //registrar evento botão continuar comprando
                setTimeout('FireCheckoutChanged()', 5000);
            }
            else {
                $(this).attr("href", urlCart);
            }

        }

    }
    )
}

function IsNumeric(value) {

    var er = /^[0-9]+$/;

    return (er.test(value)) ? true : false;

}

function ajaxRequestbuyButtonAsynchronous(method, url, postData, target, callback) {
    '',
    $.ajax({
        type: method,
        url: url,
        data: postData,
        success: function (dataResult) {

            if (target != null && target != '') {

                if (dataResult == 'false') {
                    $(target).slideDown('slow');
                    $(target).slideUp('slow');
                }

                else {

                    //$(this).removeClass("botao-comprar-clicado");
                    //$(this).addClass("btn-add-buy-button-asynchronous botao-comprar-clicado");

                    $(target).slideDown('slow');

                    $(target).html($('.buy-button-asynchronous-product-message-success').attr("value"));

                    //ocultar div depois de 3 segundos
                    setTimeout(function () {
                        $(target).slideUp('slow');
                    }, 3000);

                    //$(target).html('deu certo!');
                };
            }
            if (callback != null && callback != '') callback();
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            $(target).html('buy-button-asynchronous-product-message-fail');
        }
    });
}
