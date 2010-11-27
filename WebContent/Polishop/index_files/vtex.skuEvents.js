/// <reference path="jquery-1.4.1-vsdoc.js" />
/// <reference path="vtex.common.js" />
/// <reference path="vtex.jsevents.js" />
Namespace.create('Vtex.Commerce.JSEvents');

var skuSelectionChangedEventName = 'skuSelectionChanged';
var skuDataReceivedEventName = 'skuDataReceived';

Vtex.Commerce.JSEvents.SkuData = Class.create();
Vtex.Commerce.JSEvents.SkuData.prototype = {
    initialize: function() {
        this.id = 0;
        this.idProduct = 0;
        this.name = '';
        this.listPrice = 0.00;
        this.price = 0.00;
        this.availability = false;
        this.availabilitymessage = '';
        this.bestInstallmentValue = 0.00;
        this.bestInstallmentNumer = 0;
        this.images = new Array();
        this.reference = '';
        this.hasExtendedWarranty = false;
        this.hasExtendedWarrantyPage = false;
        this.notifyMe = false;
        this.HasServiceAtProductPage = false;
        this.HasServiceAtCartPage = false;
        this.HasServiceAtServicePage = false;
    }
}

var ListSkuData = new Array();

Vtex.Commerce.JSEvents.SkuSelectionChangedEventArgs = Class.create();
Vtex.Commerce.JSEvents.SkuSelectionChangedEventArgs.prototype = new Vtex.JSEvents.EventArgs();
Vtex.Commerce.JSEvents.SkuSelectionChangedEventArgs.prototype.newSkuId = 0;

Vtex.Commerce.JSEvents.SkuDataReceivedEventArgs = Class.create();
Vtex.Commerce.JSEvents.SkuDataReceivedEventArgs.prototype = new Vtex.JSEvents.EventArgs();
Vtex.Commerce.JSEvents.SkuDataReceivedEventArgs.prototype.skuData = null;

var skuSelectionChanged = new Vtex.JSEvents.Event(skuSelectionChangedEventName);
var skuDataReceived = new Vtex.JSEvents.Event(skuDataReceivedEventName);
var skuEventDispatcher = new Vtex.JSEvents.EventDispatcher();
skuEventDispatcher.registerEvent(skuSelectionChanged);
skuEventDispatcher.registerEvent(skuDataReceived);


function FireSkuSelectionChanged(skuId) {
    var args = new Vtex.Commerce.JSEvents.SkuSelectionChangedEventArgs();
    args.newSkuId = skuId;
    skuEventDispatcher.fireEvent(skuSelectionChangedEventName, args);
}

function FireSkuDataReceived(sku) {
    var args = new Vtex.Commerce.JSEvents.SkuDataReceivedEventArgs();
    args.skuData = sku;
    skuEventDispatcher.fireEvent(skuDataReceivedEventName, args);
}
