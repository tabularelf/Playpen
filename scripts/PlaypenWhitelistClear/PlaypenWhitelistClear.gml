function PlaypenWhitelistClear() {
	static _global = __PlaypenSystem();
	array_resize(_global.whitelist, 0);
}