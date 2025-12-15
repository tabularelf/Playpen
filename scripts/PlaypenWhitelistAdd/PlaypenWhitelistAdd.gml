/// @desc Adds a filepath to the whitelist
/// @param {string} path Description
/// @param {real} type Description
function PlaypenWhitelistAdd(_path, _type = PlaypenFlag.BOTH) {
	static _global = __PlaypenSystem();

	__PlaypenTypeValidation(nameof(PlaypenWhitelistAdd), _type);

	array_push(_global.whitelist, {
		path: __PlaypenSanitise(_path),
		type: _type
	});
}