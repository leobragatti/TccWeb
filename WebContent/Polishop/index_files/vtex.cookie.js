
$(document).ready(function() {

        //esse método está no script vtex.cookie
        cookieLatestSearchInsertUpdate("urlLastSearch", window.location.href);

});

function cookieLatestSearchInsertUpdate(name, value) {

    //se estiver numa tela de categoria, departamento, busca, que não seja numa tela de produto
    if (
            value.toString().toLowerCase().indexOf("/categoria/") > 0 ||
            value.toString().toLowerCase().indexOf("/departamento/") > 0 ||
            value.toString().toLowerCase().indexOf("/busca/") > 0 ||
            value.toString().toLowerCase().indexOf("/busca?") > 0
           ) {

        //se o cookie não existir, cria
        if (readCookie(name).length == 0)
            createCookie(name, value, 30);

        //senão atualiza
        else
            updateCookie(name, value);

    }
}

function createCookie(name, value, days) {
    
    if (days) {
        var date = new Date();
        date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
        var expires = "; expires=" + date.toGMTString();
    }
    else
        var expires = "";

    document.cookie = name + "=" + value + expires + "; path=/";
}

function updateCookie(name, value) {

    document.cookie = name + "=" + value + "; path=/";
}

function readCookie(name) {
    var nameEQ = name + "=";
    var ca = document.cookie.split(';');
    for (var i = 0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') c = c.substring(1, c.length);
        if (c.indexOf(nameEQ) == 0)
            return unescape(c.substring(nameEQ.length, c.length));
    }
    return "";
}
