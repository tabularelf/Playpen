function PlaypenWhitelistAdd(_path) {
	static _global = __PlaypenSystem();
	array_push(_global.whitelist, __PlaypenSanitise(_path));
}