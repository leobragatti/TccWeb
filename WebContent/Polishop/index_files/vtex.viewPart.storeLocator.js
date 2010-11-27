
$(document).ready(function() {
    if ($('.localize-lojas').length > 0) {
        storeLocatorOriginalHtml = $('.localize-lojas')[0].outerHTML;
        storeLocatorOnButtomOkClick();
        storeLocatorMakeOnlyNumbersFunctions();
        storeLocatorAutoTab();
    }
});

function storeLocatorOnButtomOkClick() {
    $('.store-locator-btn-ok').click(function() {
        var cepPrefix = '';
        var cepSufix = '';
        var types = '';
        
        cepPrefix = $('.store-locator-cep-prefix').val();
        cepSufix = $('.store-locator-cep-sufix').val();
        $('.store-locator-checkbox').each(function(i, checkbox) {
            if (checkbox.checked) {
                if (types != '') types = types +  ',' + $(checkbox).val();
                else types = $(checkbox).val();
            }
        });
        var url = '/Site/StoreLocatorResultado.aspx?CepPrefix=' + cepPrefix + '&CepSufix=' + cepSufix + '&Tipos=' + types;
        document.location.href = url;
    })
}

function storeLocatorAutoTab() {
    $(".store-locator-cep-prefix").keyup(function(e) {
          if ($(".store-locator-cep-prefix").val().length == 5) {
               $('.store-locator-cep-sufix').focus();
          }
    });
}

function storeLocatorMakeOnlyNumbersFunctions() {

    //when key is pressed in the textbox
    $(".vtex-text-only-numbers").keypress(function(e) {
        if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
            return false;
        }
    });

    $(".vtex-text-only-numbers").blur(function() {
        var re = /^\d+$/;
        var strTime = $(this).attr("value");
        if ((strTime != "") && (!strTime.match(re))) {
            $(this).attr("value", "");
        }
    });
}
