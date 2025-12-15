function PlaypenWhitelistAdd(_path, _type = PlaypenFlag.BOTH) {
	static _global = __PlaypenSystem();
	array_push(_global.whitelist, {
		path: __PlaypenSanitise(_path),
		type: _type
	});
}