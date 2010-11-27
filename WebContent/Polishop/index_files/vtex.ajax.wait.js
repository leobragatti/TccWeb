$(document).ready(function() {
    $('body').prepend('<div id="ajaxBusy" class="load loading"><p>Aguarde...</p></div>');
    //alert('oi');
});

//$(document).unbind(function() {
//   $('#ajaxBusy').show(); 
//})

$(document).ajaxStart(function() {
    $('#ajaxBusy').show();
    //alert('start');
}).ajaxStop(function() {
    $('#ajaxBusy').hide();
    //alert('stop');
});