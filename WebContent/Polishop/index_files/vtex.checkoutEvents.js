/// <reference path="jquery-1.4.1-vsdoc.js" />
/// <reference path="vtex.common.js" />
/// <reference path="vtex.jsevents.js" />
//Namespace.create('Vtex.Commerce.JSEvents');

var checkoutChangedEventName = 'checkoutChanged';
var checkoutDataReceivedEventName = 'checkoutDataReceived';

var checkoutChanged = new Vtex.JSEvents.Event(checkoutChangedEventName);
var checkoutDataReceived = new Vtex.JSEvents.Event(checkoutDataReceivedEventName);
var checkoutEventDispatcher = new Vtex.JSEvents.EventDispatcher();

checkoutEventDispatcher.registerEvent(checkoutChanged);
checkoutEventDispatcher.registerEvent(checkoutDataReceived);

function FireCheckoutChanged() {
    checkoutEventDispatcher.fireEvent(checkoutChangedEventName, null);
}

function FireCheckoutDataReceived() {
    checkoutEventDispatcher.fireEvent(checkoutDataReceivedEventName, null);
}
