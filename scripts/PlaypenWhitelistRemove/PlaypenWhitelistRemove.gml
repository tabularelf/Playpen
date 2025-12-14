function PlaypenWhitelistRemove(_path) {
	static _global = __PlaypenSystem();
	var _index = array_get_index(_global.whitelist, __PlaypenSanitise(_path));
	if (_index != -1) {
		array_delete(_global.whitelist, _index, 1);
	}
}