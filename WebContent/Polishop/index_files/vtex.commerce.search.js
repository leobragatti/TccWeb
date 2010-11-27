var searchFiltersToAdd = new Array(0);
var partialSearchUrl = '/busca/?';

$(document).ready(function() {
    bindMultipleSearchNavigatorCheckBoxes();
    bindAdvancedSearchBoxes();
    cleanAdvancedSearchBoxes();
    bindSearchNavigatorButtons();
});

function bindMultipleSearchNavigatorCheckBoxes() {
    $('.multi-search-checkbox').click(function() {
        onSearchNavigatorCheckBoxClick(this);
    });
}

function bindAdvancedSearchBoxes() {
    $('.advanced-search-box').blur(function() {
        onAdvancedSearchBoxBlur(this);
    });
}

function cleanAdvancedSearchBoxes() {
    $('.advanced-search-box').each(function(sender) {
        this.value = '';
    });
}

function bindSearchNavigatorButtons() {
    $('a.search-filter-button').click(function() {
        onSearchNavigatorButtonClick(this);
    });
}

function onSearchNavigatorCheckBoxClick(sender) {
    var filter = $(sender).attr('rel');
    if (sender.checked) {
        searchFiltersToAdd.add(filter);
    }
    else {
        searchFiltersToAdd.remove(filter);
    }
}

function removeFTextFilter(vector, filter) {
    var removed = false;
    var index = 0;
    while ((index < vector.length) && !removed) {
        if (vector[index].split('&')[1] == filter.split('&')[1]) {
            vector.splice(index, 1);
            removed = true;
        }
        index++;
    }
}

function onAdvancedSearchBoxBlur(sender) {
    var filter = $(sender).attr('rel');
    var value = jQuery.trim($(sender).val());

    removeFTextFilter(searchFiltersToAdd, filter);
    if (value != '') {
        var preProcessedFilter = filter.replace('##value##', value);
        var splitFilter = preProcessedFilter.split('&');
        for (i = splitFilter.length - 1; i >= 0; --i) {
            if ($.inArray(splitFilter[i], searchFiltersToAdd) == -1) {
                searchFiltersToAdd.add(splitFilter[i]);
            }
        }
    }
}

function foundOtherAdvancedSearchField(searchFilters) {
    var found = false;
    var i = 0;
    while (!found && i < searchFilters.length) {
        found = searchFilters[i].indexOf('spec_idx_') != -1;
        i++;
    }
    return found;
}

function removeQueryToFiltersToAdd(partialUrl) {
    var splitUri = partialUrl.split('?');
    var parameters = splitUri[1].split('&');
    for (i = parameters.length - 1; i >= 0; --i) {
        if ((parameters[i].length > 0) && ((parameters[i].indexOf("spec_idx_", 0) == -1) || !foundOtherAdvancedSearchField(searchFiltersToAdd))) {
            searchFiltersToAdd.add(parameters[i]);
        }
    }
    return splitUri[0] + '?';
}

function onSearchNavigatorButtonClick(sender) {
    var separator = '';
    var searchUrl = removeQueryToFiltersToAdd(partialSearchUrl);
 
    if (($.inArray("Mode=M", searchFiltersToAdd) == -1 ) && $(sender).hasClass('bt-refinar')) {
        searchFiltersToAdd.add('Mode=M');
    }

    separator = '&';
    var newsSeachFilters = '';
    for (i = 0; i < searchFiltersToAdd.length; i++) {
        newsSeachFilters += separator + searchFiltersToAdd[i];
    }
    if(newsSeachFilters.length > 0)
        newsSeachFilters = newsSeachFilters.substring(1);
    searchUrl += newsSeachFilters;
    document.location.href = searchUrl;
}

function goToTopPage() {
    $("html, body").animate({ scrollTop: 0 }, "slow");
}