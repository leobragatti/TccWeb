/// <reference name="MicrosoftAjax.js"/>
function TrackCall(UrlTrack)
{
        var query = location.search;  
        var documentReferrer = escape(document.referrer).replace(/\//g, "%2F");
        
        if(query == "") {query = "?"}else{query +="&"};
        query += "referrer=" +  documentReferrer;
        
        $.get(UrlTrack + query);
}


$(document).ready(function() {
    TrackCall("/Site/Track.aspx");
});
