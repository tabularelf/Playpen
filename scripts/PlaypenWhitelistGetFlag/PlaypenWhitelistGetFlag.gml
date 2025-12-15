/// @desc Function Description
/// @param {string} path Description
/// @return {Enum.PlaypenFlag}
function PlaypenWhitelistGetFlag(_path) {
	static _global = __PlaypenSystem();
	_path = __PlaypenSanitise((_path));
	
	var _index;
	with({_path}) _index = array_find_index(_global.whitelist, function(_elm) {
		return _path == _elm.path;
	});

	if (_index == -1) {
		return PlaypenFlag.INVALID;
	}

	return _global.whitelist[_index].type;
}