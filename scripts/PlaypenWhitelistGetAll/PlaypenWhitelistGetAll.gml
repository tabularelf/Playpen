/// @desc Function Description
/// @return {Array<String>}
function PlaypenWhitelistGetAll() {
	static _global = __PlaypenSystem();
	return array_map(_global.whitelist, function(_elm) {
		return _elm.path;
	});
}