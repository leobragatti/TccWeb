$(document).ready(runajaxloader);


function runajaxloader() {
    $('.ajax-content-loader').each(function() {
        var url = $(this).attr('rel');
        if (url.indexOf("?", 0) == -1)
            $(this).load(url + '?' + window.location.search.substring(1));
        else
            $(this).load(url + "&random=" + Math.random()*99999);
    });
}
