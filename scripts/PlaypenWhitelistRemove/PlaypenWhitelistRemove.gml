/// @desc Removes the specified filepath from the whitelist.
/// @param {string} filepath The filepath you wish to remove from the whitelist.
function PlaypenWhitelistRemove(_path) {
	static _global = __PlaypenSystem();
	var _index;
	_path = __PlaypenSanitise(_path);
	with({_path}) _index = array_find_index(_global.whitelist, function(_elm) {
		return _elm.path = _path;
	});
	
	if (_index != -1) {
		array_delete(_global.whitelist, _index, 1);
	}
}