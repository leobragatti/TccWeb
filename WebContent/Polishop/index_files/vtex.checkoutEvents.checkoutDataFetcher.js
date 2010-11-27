/// <reference path="jquery-1.4.1-vsdoc.js" />
/// <reference path="vtex.common.js" />
/// <reference path="vtex.jsevents.js" />
/// <reference path="vtex.CheckoutEvents.js" />

var checkoutDataFetcherListener = new Vtex.JSEvents.Listener('checkoutDataFetcher', checkoutDataFetcher_OncheckoutSelectionChanged);
checkoutEventDispatcher.addListener(checkoutChangedEventName, checkoutDataFetcherListener);

function checkoutDataFetcher_OncheckoutSelectionChanged(e) {
    FireCheckoutDataReceived();
}