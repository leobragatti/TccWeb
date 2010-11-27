var Class = {
    create: function () {
        /// <summary>
        /// Creates a new class definition.
        /// </summary>
        return function () {
            this.initialize.apply(this, arguments);
        }
    }
}

var Namespace = {
    create: function (name) {
        /// <summary>
        /// Creates a new namespace.
        /// </summary>
        /// <param name="name" type="String">
        /// Full name for the new namespace.
        /// </param>
        var chk = false;
        var cob = "";
        var spc = name.split(".");
        for (var i = 0; i < spc.length; i++) {
            if (cob != "") { cob += "."; }
            cob += spc[i];
            chk = this.exists(cob);
            if (!chk) { this.add(cob); }
        }
        if (chk) { throw "Namespace: " + name + " is already defined."; }
    },

    add: function (cob) {
        eval("window." + cob + " = new Object();");
    },

    exists: function (cob) {
        eval('var NE = false; try{if(' + cob + '){NE = true;}else{NE = false;}}catch(err){NE=false;}');
        return NE;
    }
}