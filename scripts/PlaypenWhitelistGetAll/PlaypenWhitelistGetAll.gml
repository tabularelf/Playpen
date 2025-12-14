function PlaypenWhitelistGetAll() {
	static _global = __PlaypenSystem();
	return variable_clone(_global.whitelist);
}