//20100512
var MEU_SUBMARINO_HOST = "/ms";
var CATALOG_ARTIST_URL = "/portal/Artista";
var CATALOG_MANUFACTURER_URL = "/portal/HomeMarca";
var SUBMARINO_LOGIN_URL = "https://www2.submarino.com.br/login.aspx?ReturnUrl=";
var SUBMARINO_IMAGES_URL = "http://img.submarino.com.br/meu.submarino.com.br/";
var SUBMARINO_MEU = "http://meu.submarino.com.br";

getAjaxHost = function() {
	return "http://" + window.location.hostname;
};

//Cookie manager object
CookieManager = function(name) {
	this.cookieName = name;
	this.separator = "&";
};

//Pega o cookie no request
CookieManager.prototype.getCookie = function() {
  var results = document.cookie.match ( '(^|;) ?' + this.cookieName + '=([^;]*)(;|$)' );

  if ( results )
    return ( unescape ( results[2] ) );
  else
    return null;
};

CookieManager.prototype.getCookieInfo = function(ident) {
	var cookie = this.getCookie(this.cookieName);
	if (cookie == null)
		return null;
		
	var parts = cookie.split(this.separator);
	
	for(var i=0;i<parts.length;i++)	{
    	var idval = parts[i].split("=");
    	if (idval[0] == ident) {
    		return idval[1];
    	}
	}
	return null;
};

// grava o cookie
CookieManager.prototype.setCookie = function( value, path, domain, secure, exp_y, exp_m, exp_d ) {
  var cookie_string = this.cookieName + "=" + escape ( value );

  if ( exp_y ) {
    var expires = new Date ( exp_y, exp_m, exp_d );
    cookie_string += "; expires=" + expires.toGMTString();
  }

  if ( path )
        cookie_string += "; path=" + escape ( path );

  if ( domain )
        cookie_string += "; domain=" + escape ( domain );
  
  if ( secure )
        cookie_string += "; secure";
  
  document.cookie = cookie_string;
}

CookieManager.prototype.parseValueToCookie = function(value) {
	value = value.replace(/\&/g,"~");
	return value;
}

CookieManager.prototype.parseValueFromCookie = function(value) {
	value = value.replace(/\~/g,"&");
	return value;
}

/////////////////////////
//LOGIN cookie manager
//
LoginSuba = function() {
	this.redirectActions = new Array();
	this.loginCM = new CookieManager("SubmarinoS");
	this.loginSubPCat = new CookieManager("SubmarinoPCat");
	
};
LoginSuba.prototype.addRedirectAction = function(action) {
	this.redirectActions.push(action);
};
LoginSuba.prototype.addRedirectActionArray = function(actions) {
	this.redirectActions = actions;
};
LoginSuba.prototype.isCooked = function() {
	var ciInfo = this.loginCM.getCookieInfo("CI");
	var ciInfoSubPCat = this.loginSubPCat.getCookieInfo("CI");

	if (ciInfo == null || ciInfo == "" || ciInfo == "999848 P 1") {
		if (ciInfoSubPCat == null || ciInfoSubPCat == "" || ciInfoSubPCat == "999848 P 1") {
			return false;
		}
	}
	return true;
};
LoginSuba.prototype.validateRedirectLoop = function() {
	var subaLogin = new CookieManager("SubmarinoS");
	var checkoutLogin = new CookieManager(".ASPXAUTH");

	if (checkoutLogin.getCookie() != ""){
                var ciInfo = this.loginCM.getCookieInfo("CI");
		var ciInfoSubPCat = this.loginSubPCat.getCookieInfo("CI");
		if (ciInfo == null || ciInfo == "" || ciInfo == "999848 P 1") {
			if (ciInfoSubPCat == null || ciInfoSubPCat == "" || ciInfoSubPCat == "999848 P 1") {
				var cookie_string = ".ASPXAUTH=; domain="+escape ( ".submarino.com.br" )+"; path=" + escape ( "/" )+"; secure";
				document.cookie = cookie_string;
			}
		}
		
	}	
}
LoginSuba.prototype.redirectNotCooked = function() {
	loginsubacookie.validateRedirectLoop();
	var ciInfo = this.loginCM.getCookieInfo("CI");
	var ciInfoSubPCat = this.loginSubPCat.getCookieInfo("CI");
	if(!loginsubacookie.isCooked()){
		window.document.location=SUBMARINO_LOGIN_URL + document.URL;
	}

};
LoginSuba.prototype.verifyNotAuthenticatedAjaxResponse = function(request) {
	isToRedirect = false;
	for(var count=0; count<this.redirectActions.length; count++) {
		if(request.url.include(this.redirectActions[count]))
			isToRedirect = true;
	}
	
	if(isToRedirect) {
		var json = null;
		try {
			if(request.responseText != null)
				json =  request.responseText.evalJSON();
			else if(request.transport.responseText != null)
				json =  request.transport.responseText.evalJSON();
		} catch(e) {};
		
		if(json != null) {
			var requestStatusOk = json.responseParameters.requestStatusOk;
			var requestStatusError = json.responseParameters.requestStatusError;
			var requestStatus = json.responseParameters.requestStatus;
			var requestErrorStatusCode = json.responseParameters.requestErrorStatusCode;
			
			if(requestStatusError != null && requestStatus == requestStatusError) {
				if (requestErrorStatusCode == "customerUnauthenticated" || requestErrorStatusCode == "customerNotCooked") {
					loginsubacookie.validateRedirectLoop();
					window.document.location=SUBMARINO_LOGIN_URL + document.URL;
				}
			}
		}
	}
};

LoginSuba.prototype.redirectReviewNotCooked = function( condition, anchor ) {
	loginsubacookie.validateRedirectLoop();
	if(!loginsubacookie.isCooked()){
		window.document.location=SUBMARINO_LOGIN_URL +document.URL + "?" + condition + "#" + anchor;
	}
};
LoginSuba.prototype.redirectNotCookedWithParameters = function(parameters) {
	loginsubacookie.validateRedirectLoop();
	if(!loginsubacookie.isCooked()){
		window.document.location=SUBMARINO_LOGIN_URL + SUBMARINO_MEU + document.location.pathname + "?" + parameters ;
	}

};


/////////////////////////
//Tracking cookie manager
//
Tracking = function() {
	this.cookieManager = new CookieManager("Track");
	this.cookie = this.cookieManager.getCookie();
};

Tracking.prototype.setCookie = function( value, path, domain, secure, exp_y, exp_m, exp_d ) {
	var data = new Date();
	this.cookieManager.setCookie( value, path, domain, secure, data.getFullYear()+4, data.getMonth(), data.getDate() );
	this.cookie = this.cookieManager.getCookie();
}

Tracking.prototype.checkCIsOk = function() {
	var ckManagerSub = new CookieManager("SubmarinoS");
	var custid = null;
	if (ckManagerSub.getCookie() != null){
		custid = ckManagerSub.getCookieInfo("CI");
		//Caso o CI do SubmarinoS esteja errado, pega o valor do CI do cookie SubimarinoPCat
		if (custid == null || custid == "" || custid == "999848 P 1") {
			var loginSubPCat = new CookieManager("SubmarinoPCat");
			var ciInfoSubPCat = loginSubPCat.getCookieInfo("CI");
			custid = ciInfoSubPCat;
		}
	}
	
	if (this.cookie != null) {
		if (custid != null) {
			var trackid = this.cookieManager.getCookieInfo("CI");
			
			if (trackid == null) {
				return true;
			}
				
			if (custid != trackid) {
				return false;
			}
		}
	}
	return true;
}

Tracking.prototype.removeTrackInfo = function(type, id, separator) {
	id = this.cookieManager.parseValueToCookie(id);
	
	var trackinfo = this.cookieManager.getCookieInfo(type);
	if (trackinfo == null) {
		return;
	}

	var next = "";
	if (id != "") {
		var items = trackinfo.split(separator);
		var exists = -1;
		for(var i=0; i<items.length; i++) {
			if (items[i] == id)
				exists = i;
		}
		
		items.splice(exists,1);
		
		next = items.join(separator);
	}
	
	this.setNewCookie(type, next);
}

Tracking.prototype.addTrackInfo = function(type, id, max, separator) {
	id = this.cookieManager.parseValueToCookie(id);
	
	var trackinfo = this.cookieManager.getCookieInfo(type);
	if (trackinfo == null || !this.checkCIsOk()) {
		this.setNewCookie(type, id);
		return;
	}
		
	var items = trackinfo.split(separator);
	var exists = -1;
	for(var i=0; i<items.length; i++) {
		if (items[i] == id)
			exists = i;
	}

	if (exists > -1) {
		items.splice(exists,1);
	}
	else {
		if (items.length >= max)
			items.pop();
	}
	
	var next = items.join(separator);
	next = id + separator + next;

	this.setNewCookie(type, next);
}

Tracking.prototype.setNewCookie = function(ident, value) {
	var ckManagerSub = new CookieManager("SubmarinoS");
	var custid = null;
	if (ckManagerSub.getCookie() != null && loginsubacookie.isCooked()){
		custid = ckManagerSub.getCookieInfo("CI");
		//Caso o CI do SubmarinoS esteja errado, pega o valor do CI do cookie SubimarinoPCat
		if (custid == null || custid == "" || custid == "999848 P 1") {
		    var loginSubPCat = new CookieManager("SubmarinoPCat");
			var ciInfoSubPCat = loginSubPCat.getCookieInfo("CI");
			custid = ciInfoSubPCat;
		}
	}
	
	var CItoAdd = null;
	if (this.cookie != null) {
		if (custid != null) {
			var trackid = this.cookieManager.getCookieInfo("CI");
			
			if (trackid == null) {
				CItoAdd = custid;
			}
				
			if (custid != trackid) {
				this.setCookie("CI=" + custid + "&" + ident + "=" +value, "/", ".submarino.com.br");
				return;
			}
		}
			
		var parts = this.cookie.split("&");
		var haspart = false;
		var part = -1;
		for(var i=0;i<parts.length;i++)	{
	    	var idval = parts[i].split("=");
	    	if (idval[0] == ident) {
		    	haspart = true;
	    		idval[1] = value;
	    		parts[i] = idval.join("=");
	    		part = i;
	    	}			  //parameters: { text: $F('text') }
	    	
		}
		
		if (part > -1 && value == "") {
			parts.splice(part,1);
		}
		 
		if (!haspart) {
			parts[parts.length] = ident + "=" + value;
		}
		
		if (CItoAdd != null) {
			parts[parts.length] = "CI=" + CItoAdd;
		}
		
		this.setCookie(parts.join("&"), "/", ".submarino.com.br");
	}
	else {
		//Usuario não cookado
		if (custid == null) {
			this.setCookie(ident + "=" +value, "/", ".submarino.com.br");
		}
		else {
			this.setCookie("CI=" + custid + "&" + ident + "=" +value, "/", ".submarino.com.br");
		}
	}
}

//=======METODOS PARA ADICIONAR AO TRACK==============
Tracking.prototype.addVisitedProduct = function(productId, menuId) {
	this.addTrackInfo("Product", productId + "|" + menuId, 12, ",");
};

Tracking.prototype.addBasketProduct = function(productId, menuId) {
	this.addTrackInfo("Basket", productId + "|" + menuId, 10, ",");
};

Tracking.prototype.addSearchHistory = function(term, department) {
	this.addTrackInfo("Search", term + ":" + department, 10, "^");
};

Tracking.prototype.addDepartment = function(depto, menuId) {
	this.addTrackInfo("Department", depto  + ":" + menuId, 10, ",");
};

//=======METODOS PARA REMOVER DO TRACK==============
Tracking.prototype.removeVisitedProduct = function(productId, menuId) {
	this.removeTrackInfo("Product", productId + "|" + menuId, ",");
};

Tracking.prototype.removeBasketProduct = function(productId, menuId) {
	this.removeTrackInfo("Basket", productId + "|" + menuId, ",");
};

Tracking.prototype.removeSearchHistory = function(term, department) {
	this.removeTrackInfo("Search", term + ":" + department, "^");
};

Tracking.prototype.removeDepartment = function(depto, menuId) {
	this.removeTrackInfo("Department", depto  + ":" + menuId, ",");
};

//=======METODO PARA TUDO (do tipo) DO TRACK==============
Tracking.prototype.removeAllByType = function(type) {
	this.removeTrackInfo(type,"");
};


/////////////////////////
//MeuSuba cookie manager
//
MeuSuba = function() {
	this.getAllInvoked = false;
	this.cookieManager = new CookieManager("MeuSubmarino");
	this.cookieManagerEx = new CookieManager("MeuSubmarinoEx");
	this.cookie = this.cookieManager.getCookie();
	this.departments = "";
	this.artists = "";
	this.artistsnames = "";
	this.manufacturers = "";
	this.manufacturersnames = "";
	this.topSite = "";
	this.loaded = false;
};

MeuSuba.prototype.departmentsAvailable = function() {
	if (meusubacatalogo.meusuba.departments == "" && meusubacatalogo.meusuba.loaded == false) 
		return false;
	return true;
};

MeuSuba.prototype.topSiteAvailable = function() {
	if (meusubacatalogo.meusuba.topSite == "" && meusubacatalogo.meusuba.loaded == false) 
		return false;
	return true;
};

MeuSuba.prototype.artistsAvailable = function() {
	if (meusubacatalogo.meusuba.artists == "" && meusubacatalogo.meusuba.loaded == false) 
		return false;
	return true;
};

MeuSuba.prototype.manufacturersAvailable = function() {
	if (meusubacatalogo.meusuba.manufacturers == "" && meusubacatalogo.meusuba.loaded == false) 
		return false;
	return true;
};

MeuSuba.prototype.loadAllPersonalization = function(callbackFunction) {
	// Se ja chamou nao chama de novo
	if (this.getAllInvoked)
		return;
	
	//Id usuario no cookie SubmarinoS(Dados de login)
	this.loginS = new CookieManager("SubmarinoS");
	var ciInfoS = this.loginS.getCookieInfo("CI");
	
	//Caso o CI do SubmarinoS esteja errado, pega o valor do CI do cookie SubimarinoPCat
	if (ciInfoS == null || ciInfoS == "" || ciInfoS == "999848 P 1") {
	    var loginSubPCat = new CookieManager("SubmarinoPCat");
		var ciInfoSubPCat = loginSubPCat.getCookieInfo("CI");
		ciInfoS = ciInfoSubPCat;
	}

	//Id usuario no cookie MeuSubmarino(Personalizacoes)
	this.loginM = new CookieManager("MeuSubmarino");
	var ciInfoM = this.loginM.getCookieInfo("CI");
	
	this.loginS = new CookieManager("SubmarinoP");
	var nickInfoP = this.loginS.getCookieInfo("Nick");
	
	// não personalizado ou com personalizacao de outro usuario, chama via ajax
	if ((ciInfoS != null && ciInfoS != "") && (this.cookie == null || (ciInfoM != ciInfoS && nickInfoP != null && nickInfoP != "")) ) {
		this.getAllInvoked = true;
		var URL = getAjaxHost() + MEU_SUBMARINO_HOST + "/integration/ajax/getAll.do";
		var params = "topSite=true&personalizedDepartaments=true&favouriteArtists=true&favouriteBrands=true";
				
		var request = new Ajax.Request(
			URL, 
			{
				method: "post", 
				parameters: params, 
				//onCreate: onCreateCallback,
				onSuccess: function(transport) {
					var json =  transport.responseText.evalJSON();
					
					//var requestStatusOk = json.responseParameters.requestStatusOk;
					///var requestStatusError = json.responseParameters.requestStatusError;
					//var requestStatus = json.responseParameters.requestStatus;
					//var customerHadPersonalization = json.responseParameters.customerHadPersonalization;
					var personalizedDepartmentsQuantity = json.responseParameters.personalizedDepartmentsQuantity;
					var favouriteArtistsQuantity = json.responseParameters.favouriteArtistsQuantity;
					var favouriteBrandsQuantity = json.responseParameters.favouriteBrandsQuantity;
					
					meusubacatalogo.meusuba.departments = "";
					meusubacatalogo.meusuba.topSite = "";
					
					if (json.responseParameters.topSiteId != undefined)
						meusubacatalogo.meusuba.topSite = json.responseParameters.topSiteId;

					if (json.responseParameters.personalizedDepartmentsQuantity != undefined) {
						var virg = "";
						for(var i = 1; i<= personalizedDepartmentsQuantity; i++) {		
							temp = json.responseParameters["personalizedDepartments"+i];
							meusubacatalogo.meusuba.departments = meusubacatalogo.meusuba.departments + virg + temp;
							virg = ",";
						}
					}

					meusubacatalogo.meusuba.artists = "";
					meusubacatalogo.meusuba.artistsnames = "";
					if (json.responseParameters.favouriteArtistsQuantity != undefined) {
						var virg = "";
						for(var i = 1; i<= favouriteArtistsQuantity; i++) {		
							temp = json.responseParameters["favouriteArtists"+i];
							tempName = json.responseParameters["favouriteArtistsName"+i];
							tempName = tempName.replace(",", ":");
							meusubacatalogo.meusuba.artists = meusubacatalogo.meusuba.artists + virg + temp;
							meusubacatalogo.meusuba.artistsnames = meusubacatalogo.meusuba.artistsnames + virg + tempName;
							virg = ",";
						}
					}

					meusubacatalogo.meusuba.manufacturers = "";
					meusubacatalogo.meusuba.manufacturersnames = "";
					if (json.responseParameters.favouriteBrandsQuantity != undefined) {
						var virg = "";
						for(var i = 1; i<= favouriteBrandsQuantity; i++) {		
							temp = json.responseParameters["favouriteBrands"+i];
							tempName = json.responseParameters["favouriteBrandsName"+i];
							tempName = tempName.replace(",", ":");
							meusubacatalogo.meusuba.manufacturers = meusubacatalogo.meusuba.manufacturers + virg + temp;
							meusubacatalogo.meusuba.manufacturersnames = meusubacatalogo.meusuba.manufacturersnames + virg + tempName;
							virg = ",";
						}
					}
					
					meusubacatalogo.meusuba.loaded = true;

					callbackFunction();
				}
				//onFailure: getDepartmentsAjaxFailedCallback
			}
		);
	}
	else {	
		meusubacatalogo.meusuba.artists = "";
		meusubacatalogo.meusuba.artistsnames = "";
		var qtdAr = meusubacatalogo.meusuba.cookieManager.getCookieInfo("favouriteArtistsQuantity");
		if (qtdAr != null) {
			var virg = "";
			for (var i=1; i<=qtdAr; i++) {
				var artistId = meusubacatalogo.meusuba.cookieManager.getCookieInfo("favouriteArtists" + i);
				var artistName = meusubacatalogo.meusuba.cookieManagerEx.getCookieInfo("favouriteArtistsName" + i);
				if (artistName != null && artistId != null) {
					artistName = artistName.replace(/\+/," ");
					artistName = this.cookieManager.parseValueFromCookie(artistName);
					artistName = artistName.replace(",", ":");
					meusubacatalogo.meusuba.artists = meusubacatalogo.meusuba.artists + virg + artistId;
					meusubacatalogo.meusuba.artistsnames = meusubacatalogo.meusuba.artistsnames + virg + artistName;
					virg = ",";
				}
			}
		}

		meusubacatalogo.meusuba.manufacturers = "";
		meusubacatalogo.meusuba.manufacturersnames = "";
		var qtdAr = meusubacatalogo.meusuba.cookieManager.getCookieInfo("favouriteBrandsQuantity");
		if (qtdAr != null) {
			var virg = "";
			for (var i=1; i<=qtdAr; i++) {
				var manufacturerId = meusubacatalogo.meusuba.cookieManager.getCookieInfo("favouriteBrands" + i);
				var manufacturerName = meusubacatalogo.meusuba.cookieManagerEx.getCookieInfo("favouriteBrandsName" + i);
				if (manufacturerName != null && manufacturerId != null) {
					manufacturerName = manufacturerName.replace(/\+/," ");
					manufacturerName = manufacturerName.replace(",", ":");
					manufacturerName = this.cookieManager.parseValueFromCookie(manufacturerName);
					
					meusubacatalogo.meusuba.manufacturers = meusubacatalogo.meusuba.manufacturers + virg + manufacturerId;
					meusubacatalogo.meusuba.manufacturersnames = meusubacatalogo.meusuba.manufacturersnames + virg + manufacturerName;
					virg = ",";
				}
			}
		}
									
		meusubacatalogo.meusuba.departments = "";
		var qtd = meusubacatalogo.meusuba.cookieManager.getCookieInfo("personalizedDepartmentsQuantity");
		if (qtd != null) {
			var virg = "";
			for (var i=1; i<=qtd; i++) {
				var dpto = meusubacatalogo.meusuba.cookieManager.getCookieInfo("personalizedDepartments" + i);
				meusubacatalogo.meusuba.departments = meusubacatalogo.meusuba.departments + virg + dpto;
				virg = ",";
			}
		}
		
		meusubacatalogo.meusuba.topSite = "";
		var topsite = meusubacatalogo.meusuba.cookieManager.getCookieInfo("topSiteId");
		if (topsite != null)
			meusubacatalogo.meusuba.topSite = topsite;
		
		meusubacatalogo.meusuba.loaded = true;

		callbackFunction();
	}

//	return departments;
};

MeuSuba.prototype.saveTop = function(topUrl, callbackFunction) {
	var URL = getAjaxHost() + MEU_SUBMARINO_HOST + "/integration/ajax/setCustomerTopSite.do";
	
	if (topUrl != "") {
		params = "topSiteId=" + topUrl;
		
		var request = new Ajax.Request(
			URL, 
			{
				method: "post", 
				parameters: params, 
				onSuccess: function(transport) {
					var json =  transport.responseText.evalJSON();
					
					var requestStatusOk = json.responseParameters.requestStatusOk;
					var requestStatusError = json.responseParameters.requestStatusError;
					var requestStatus = json.responseParameters.requestStatus;
					var topSiteId = json.responseParameters.topSiteId;
					if(requestStatus != null && requestStatusOk != null && requestStatus == requestStatusOk) {
						meusubacatalogo.meusuba.topSite = topSiteId;
						callbackFunction(true);
					} else {
						callbackFunction(false);
					}
				},
				onFailure: function(transport) {
					callbackFunction(false)
				}
			}
		);
	}
};

MeuSuba.prototype.saveDepartments = function(deptosStr, callbackFunction) {
	var URL = getAjaxHost() + MEU_SUBMARINO_HOST + "/integration/ajax/setPersonalizedDepartments.do";
	var params = "";
	var total = 0;
	
	if (deptosStr != "") {
		var deptos = deptosStr.split(",");
		for (i=0; i < deptos.length; i++) {		
			if (i > 0) {
				params += "&";
			}
			
			total++;
			params += "personalizedDepartments"+total+"="+deptos[i];
		}
		
		params += "&personalizedDepartmentsQuantity="+total;
	}
	else
		params += "personalizedDepartmentsQuantity=0";
		
	var request = new Ajax.Request(
		URL, 
		{
			method: "post", 
			parameters: params, 
			//onCreate: onCreateCallback,
			onSuccess: function(transport) {
				meusubacatalogo.meusuba.departments = deptosStr;
				callbackFunction();
			}
			//onFailure: setDepartmentsAjaxFailedCallback
		}
	);
};

MeuSuba.prototype.userAuthenticated = function() {

};

/////////////////////////
//MeuSuba cookie manager
//
MeuSubaCatalogo = function() {
	this.meusuba = new MeuSuba();
	this.topClasses = ["header", "header home", "header store"];
	this.currentPreviewTopTimeout = null;
	this.defaultTopImageUrl = SUBMARINO_IMAGES_URL + "img/headerBg.png";
	this.departmentPlusOtherLinksMax = 14; //9 dptos, 1 + 3 + 1 no confira
    this.isShowArtists=false;
	this.isShowManufacturers=false;
};

MeuSubaCatalogo.prototype.getParentMenuItens = function(classname) {
	node = document.getElementsByTagName("body")[0];
	var a = [];
	var re = new RegExp('\\b' + classname + '\\b');
	var els = node.getElementsByTagName("*");
	for(var i=0,j=els.length; i<j; i++)
		if(re.test(els[i].className))a.push(els[i]);
	return a;
};

MeuSubaCatalogo.prototype.showInitialPersonalization = function() {
	meusubacatalogo.showPersonalizedTop();
	meusubacatalogo.showDepartments();
	if(meusubacatalogo.isShowArtists)
		meusubacatalogo.showArtists();
	if(meusubacatalogo.isShowManufacturers)
		meusubacatalogo.showManufacturers();
}

MeuSubaCatalogo.prototype.isTopClass = function(className) {
	for(isTopClassCount=0; isTopClassCount<this.topClasses.length; isTopClassCount++) {
		if(this.topClasses[isTopClassCount] == className)
			return true;
	}
	
	return false;
};

MeuSubaCatalogo.prototype.getTopObject = function() {
	for(getTopObjectCount=0; getTopObjectCount<this.topClasses.length; getTopObjectCount++) {
		var elements = $$('div.'+this.topClasses[getTopObjectCount]);
		if(elements.length == 1 && this.isTopClass($w(elements[0].className)[0])) {
			return elements[0];
		}
	}
};

MeuSubaCatalogo.prototype.showPersonalizedTop = function() {
	if (!meusubacatalogo.meusuba.topSiteAvailable()) {
		meusubacatalogo.meusuba.loadAllPersonalization(meusubacatalogo.showPersonalizedTop);
		return;
	}

	if (meusubacatalogo.meusuba.topSite == "")
		return;

	meusubacatalogo.applyTop(meusubacatalogo.meusuba.topSite);
};

MeuSubaCatalogo.prototype.applyTop = function(topUrl) {
	var oTop = this.getTopObject();
	if(oTop != null) {
		oTop.setStyle({
		  backgroundImage: "url('" + topUrl + "')"
		});
	}
};

MeuSubaCatalogo.prototype.previewTop = function(topUrl, previewTimeInSeconds) {
	var oTop = this.getTopObject();
	this.applyTop(SUBMARINO_IMAGES_URL + topUrl);
	
	if(this.currentPreviewTopTimeout != null)
		clearTimeout(this.currentPreviewTopTimeout);
	
	if(meusubacatalogo.meusuba.topSite == "")
		this.currentPreviewTopTimeout = setTimeout("meusubacatalogo.applyTop('"+this.defaultTopImageUrl+"');", previewTimeInSeconds*1000);	
	else
		this.currentPreviewTopTimeout = setTimeout("meusubacatalogo.showPersonalizedTop();", previewTimeInSeconds*1000);	
};

MeuSubaCatalogo.prototype.showManufacturers = function() {
	if (!meusubacatalogo.meusuba.manufacturersAvailable()) {
		meusubacatalogo.meusuba.loadAllPersonalization(meusubacatalogo.showManufacturers);
		return;
	}
	
	var ol = document.getElementById("myMenuBoxSuplierList");
	var len = ol.childNodes.length;
	var toRemove = new Array();
	var toRemoveIdx = 0;
	var savedSeeAll = "";
	for (var i=0; i < len; i++) {
		var manufacturer = ol.childNodes[i];
		if (manufacturer == undefined || manufacturer == null || manufacturer.innerHTML == undefined) { 
			continue; 
		}

		if (manufacturer.id != null && !manufacturer.id	== "") {
			if (manufacturer.id.startsWith("persManufacturer")) {
				toRemove[toRemoveIdx] = manufacturer;
				toRemoveIdx++;
			}	
		}

		if (manufacturer.className != "seeAll") {
			if(meusubacatalogo.meusuba.manufacturers == "" || meusubacatalogo.meusuba.manufacturersnames == "") {
				manufacturer.style.display = "";
			} else {
				manufacturer.style.display = "none";
			}			
		} 
		else {
			savedSeeAll = manufacturer;
		}
	}
	
	for (var i=0; i < toRemove.length; i++) {
		ol.removeChild(toRemove[i]);
	}

	var manufacturersIds = meusubacatalogo.meusuba.manufacturers.split(",");
	var manufacturersNames = meusubacatalogo.meusuba.manufacturersnames.split(",");
	
	for (var i=0; i < manufacturersIds.length; i++) {
		if(manufacturersIds[i] != "") {
			var finalName = manufacturersNames[i].replace(/\+/g," ");
			finalName = finalName.replace(":", ",");
			if (finalName.length > 29)
				finalName = finalName.substring(0,26) + "...";
				
			var li = new Element('li');
			li.id = "persManufacturer" + manufacturersIds[i];
			var a = new Element('a');
			a.href = getAjaxHost() + CATALOG_MANUFACTURER_URL + "/" + manufacturersIds[i];
			a.innerHTML = finalName;
			li.appendChild(a);
			ol.appendChild(li);
		}
	}
	ol.appendChild(savedSeeAll);
}

MeuSubaCatalogo.prototype.showArtists = function() {
	if (!meusubacatalogo.meusuba.artistsAvailable()) {
		meusubacatalogo.meusuba.loadAllPersonalization(meusubacatalogo.showArtists);
		return;
	}
		
	var ol = document.getElementById("myMenuBoxPersonList");
	var len = ol.childNodes.length;
	var toRemove = new Array();
	var toRemoveIdx = 0;
	var savedSeeAll = "";
	for (var i=0; i < len; i++) {
		var artist = ol.childNodes[i];
		if (artist == undefined || artist == null || artist.innerHTML == undefined) { continue; }

		if (artist.id != null && !artist.id	== "") {
			if (artist.id.startsWith("persArtist")) {
				toRemove[toRemoveIdx] = artist;
				toRemoveIdx++;
			}	
		}

		if (artist.className != "seeAll") {
			if(meusubacatalogo.meusuba.artists == "" || meusubacatalogo.meusuba.artistsnames == "") {
				artist.style.display = "";
			} else {
				artist.style.display = "none";
			}
		} 
		else {
			savedSeeAll = artist;
		}
	}
	
	for (var i=0; i < toRemove.length; i++) {
		ol.removeChild(toRemove[i]);
	}

	var artistsIds = meusubacatalogo.meusuba.artists.split(",");
	var artistsNames = meusubacatalogo.meusuba.artistsnames.split(",");

	for (var i=0; i < artistsIds.length; i++) {
		if(artistsIds[i] != "") {
			var finalName = artistsNames[i].replace(/\+/g," ");
			finalName = finalName.replace(":", ",");
			if (finalName.length > 29)
				finalName = finalName.substring(0,26) + "...";
	
			var li = new Element('li');
			li.id = "persArtist" + artistsIds[i];
			var a = new Element('a');
			a.href = getAjaxHost() + CATALOG_ARTIST_URL + "/" + artistsIds[i];
			a.innerHTML = finalName;
			li.appendChild(a);
			ol.appendChild(li);
		}
	}
	ol.appendChild(savedSeeAll);
}

MeuSubaCatalogo.prototype.showDepartments = function() {
	var maindiv = meusubacatalogo.getParentMenuItens("departments");
	if (!meusubacatalogo.meusuba.departmentsAvailable()) {
		meusubacatalogo.meusuba.loadAllPersonalization(meusubacatalogo.showDepartments);
		return;
	}

	
	var meusubadeptos = meusubacatalogo.meusuba.departments.split(",");
	var deptos = maindiv[0].getElementsByTagName("*");

	var options = document.getElementsByName("option");
	for (i=0; i < options.length; i++) {
		options[i].checked = false;
		for (j=0; j < meusubadeptos.length; j++) {		
			if (options[i].value == meusubadeptos[j])
				options[i].checked = true;
		}
	}
	
	var deptosShown = 0;
	for (var i=0; i<deptos.length; i++) {
		if (meusubadeptos == "") {
			if (deptos[i].className == "item") {
				if (deptos[i].id.indexOf("item_") == 0)
					deptos[i].style.display="none";
				else if (deptos[i].id == "allStores"){
					deptos[i].style.display="none";
				}
				else {
					deptos[i].style.display="block";
					deptosShown++;
				}
			}
			
			document.getElementById("allStoreTitle").style.display="block";
			document.getElementById("myStoreTitle").style.display="none";
		}
		else {
			if (deptos[i].id.indexOf("item_") == 0) {
				var showitem = false;
				for(var j=0; j<meusubadeptos.length; j++) {
					if (deptos[i].id == ("item_" + meusubadeptos[j])) {
						deptos[i].style.display="block";
						deptosShown++;
						showitem = true;
					}
				}
				if (!showitem) {
					deptos[i].style.display="none";
				}
			}
			else if (deptos[i].id == "allStores"){
				deptos[i].style.display="block";
				deptosShown++;
			}
			else if (deptos[i].className == "item") {
				deptos[i].style.display="none";
			}
			
			document.getElementById("allStoreTitle").style.display="none";
			document.getElementById("myStoreTitle").style.display="block";
		}
	}
	
	if(meusubacatalogo.meusuba.departments != "") {
		document.getElementById("mainNavMenu").className = "mainNav custom";
	} else {
		document.getElementById("mainNavMenu").className = "mainNav";
	}
	
	meusubacatalogo.showOthers(deptosShown);
};

MeuSubaCatalogo.prototype.showOthers = function(qtddeptos) {
	var maindiv = meusubacatalogo.getParentMenuItens("others");
	var sons = maindiv[0].getElementsByTagName("*");

	var show = meusubacatalogo.departmentPlusOtherLinksMax - qtddeptos - 2; //2=primeiro e ultimo, fixos
	for (var i=0; i<sons.length; i++) {
		if (sons[i].id.indexOf("item_middle_") == 0) {
			var visible = false;
			for (var j=0; j<show; j++) {
				if (sons[i].id.indexOf("item_middle_" + j) == 0) {
					sons[i].style.display="";
					visible = true;
				}
			}
			
			if (!visible)
				sons[i].style.display="none";
		}
	}
};

MeuSubaCatalogo.prototype.clearDepartments = function() {
	var options = document.getElementsByName("option");
	for (i=0; i < options.length; i++) {		
		if (options[i].checked)
			options[i].checked = false;
	}
	meusubacatalogo.saveDepartments();
}

MeuSubaCatalogo.prototype.saveDepartments = function() {
	var deptostemp = "";
	var virg = "";
	var options = document.getElementsByName("option");
	for (i=0; i < options.length; i++) {		
		if (options[i].checked) {
			deptostemp = deptostemp + virg + options[i].value;
			virg = ",";
		}		
	}

	meusubacatalogo.meusuba.saveDepartments(deptostemp, meusubacatalogo.showDepartments);
};


/////////////////////////
//MeuSuba Component manager
//
MeuSubaComponent = function() {

};

MeuSubaComponent.prototype.loadTrackingComponent = function() {
	if (meusubatracking.cookie == null || meusubatracking.cookie == "")
		return;
	var ckManagerSub = new CookieManager("SubmarinoS");
	
	if (ckManagerSub != null)  {
		var custinfo = ckManagerSub.getCookieInfo("CI");
		//Caso o CI do SubmarinoS esteja errado, pega o valor do CI do cookie SubimarinoPCat
		if (custinfo == null || custinfo == "" || custinfo == "999848 P 1") {
			var loginSubPCat = new CookieManager("SubmarinoPCat");
			var ciInfoSubPCat = loginSubPCat.getCookieInfo("CI");
			custinfo = ciInfoSubPCat;
		}
		var trackinfo = meusubatracking.cookieManager.getCookieInfo("CI");
	
		if (custinfo != null && trackinfo != null && custinfo != trackinfo)
			return;
	}

	var divName = 'moreDesired';
	var url = getAjaxHost() + MEU_SUBMARINO_HOST + '/mynavigation/trackingCatalogComponent.do';
	
	new Ajax.Updater({ success: divName }, url,
	{
		evalScripts: true,
		method: 'post'
	});
}

MeuSubaComponent.prototype.loadArtistPersonalizationComponent = function() {
	if (!loginsubacookie.isCooked()) {
		loginsubacookie.redirectNotCooked();
		return false;
	}

	var divName = 'customizeArtists';
	var url = getAjaxHost() + MEU_SUBMARINO_HOST + '/artist/components/selectFavouriteArtists.do';
	
	new Ajax.Updater({ success: divName }, url,
	{
		evalScripts: true,
		method: 'post'
			  //parameters: { text: $F('text') }
	});
	document.getElementById("customizeArtists").style.display="";
}

MeuSubaComponent.prototype.loadManufacturerPersonalizationComponent = function() {
	if (!loginsubacookie.isCooked()) {
		loginsubacookie.redirectNotCooked();
		return false;
	}
	
	var divName = 'customizeManufacturers';
	var url = getAjaxHost() + MEU_SUBMARINO_HOST + '/manufacturer/components/selectFavouriteManufacturers.do';
	
	new Ajax.Updater({ success: divName }, url,
	{
		evalScripts: true,
		method: 'post'
			  //parameters: { text: $F('text') }
	});
	document.getElementById("customizeManufacturers").style.display="";
}

var meusubacatalogo = new MeuSubaCatalogo();
var meusubatracking = new Tracking();
var meusubacomponent = new MeuSubaComponent();
var loginsubacookie = new LoginSuba();
loginsubacookie.addRedirectActionArray([ "setIOwnIt.do", "setNotInterested.do", "setProductRating.do", "addTag.do", "updateTagsByProduct.do", "createReview.do", "searchArtist.do", "setFavouriteArtists.do", "searchManufacturer.do", "setFavouriteBrands.do", "setCustomerTopSite.do", "setPersonalizedDepartments.do", "selectFavouriteArtists.do", "selectFavouriteManufacturers.do", "markAsUseful.do", "markAsUseless.do", "setDontUseToRecommendation.do","searchedTagsResultSearchMyTags.do" ]);

Ajax.Responders.register({
  onComplete: function(request) {
    loginsubacookie.verifyNotAuthenticatedAjaxResponse(request);
  }
});
