function enableFullTextSearchBox(textBox, dropDown, button) {
    $('#' + textBox).val('Digite aqui');
    $('#' + textBox).focus(function() {
        $(this).filter(function() {
            return $(this).val() == '' || $(this).val() == 'Digite aqui';
        }).val('');
    });
    $('#' + textBox).blur(function() {
        $(this).filter(function() {
            return $(this).val() == '';
        }).val('Digite aqui');
    });
    $('#' + textBox).keypress(function(k) {
        if (k.which == 13) {
            doSearch(textBox, dropDown);
        }
    });
    $('#' + button).click(function() {
        doSearch(textBox, dropDown);
    });
}

function doSearch(textBox, dropDown) {
    var ft = jQuery.trim($('#' + textBox).val());
    var dept = $('#' + dropDown).val();
    if (ft != '' && ft != 'Digite aqui') {
        var url = '/busca?ft=' + encodeURIComponent(ft);
        if (dept != '') {
            url = url + '&fq=C:' + dept + '/';
        }
        document.location.href = url;
    }
}



$(function() {
    function gotoHref(href) {
        document.location.href = href;
    }

    try {
        $(".fulltext-search-box").autocomplete({
            source: function(request, response) {
                $.ajax({
                    url: "/buscaautocomplete/",
                    dataType: "json",
                    data: {
                        maxRows: 12,
                        productNameContains: request.term
                    },
                    success: function(data) {
                        if (data != null) {
                            response($.map(data.itemsReturned, function(item) {
                                return {
                                    label: item.thumb + "&nbsp;" + item.name,
                                    value: item.name,
                                    href: item.href
                                }
                            }))
                        }
                    } 
                })
            },
            minLength: 3,
            delay: 500,
            select: function(event, ui) {
                //gotoHref(ui.item ? ("Selected: " + ui.item.label) : "Nothing selected, input was " + this.value);
                gotoHref(ui.item.href);
            },
            open: function() {
                $(this).removeClass("ui-corner-all").addClass("ui-corner-top");
            },
            close: function() {
                $(this).removeClass("ui-corner-top").addClass("ui-corner-all");
            }
        });

    }
    catch (erro) {
        alert(erro.Message);
    }
});











//http://www.devbridge.com/projects/autocomplete/jquery/
//////$(document).ready(function() {
//////    var a1; 
//////    var onAutocompleteSelect = function(value, data) {
////////        $('#selection').html('<img src="\/global\/flags\/small\/' + data + '.png" alt="" \/> ' + value);
//////        alert('oi');
//////    }

//////    var options = {
//////        serviceUrl: '/busca',
//////        width: 300,
//////        delimiter: /(,|;)\s*/,
//////        onSelect: onAutocompleteSelect,
//////        deferRequestBy: 500, //miliseconds
//////        //params: { country: 'Yes' },
//////        noCache: false, //set to true, to disable caching
//////        lookup: ['January', 'February', 'March', 'April', 'May', 'January', 'February', 'March', 'April', 'May', 'January', 'February', 'March', 'April', 'May'] //local lookup values 

//////    };

//////    a1 = $('.fulltext-search-box').autocomplete(options);

//////    $('#navigation a').each(function() {
//////        $(this).click(function(e) {
//////            var element = $(this).attr('href');
//////            $('html').animate({ scrollTop: $(element).offset().top }, 300, null, function() { document.location = element; });
//////            e.preventDefault();
//////        });
//////    });

//////});

//////function fnFormatResult(value, data, currentValue) {
//////    var pattern = '(' + currentValue.replace(reEscape, '\\$1') + ')';
//////    return value.replace(new RegExp(pattern, 'gi'), '<strong>$1<\/strong>');
//////}


