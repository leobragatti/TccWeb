
var LoadAPI = Class.create({
	funcs : new Array(),
	addFunction : function(f) {
		funcs.push(f);
	},
	executeAll : function() {
		for (f in funcs) {
			f();
		}
	}
});