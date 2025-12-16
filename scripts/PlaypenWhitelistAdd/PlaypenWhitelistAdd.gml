/// @desc Adds a filepath to the whitelist
/// @param {string} filepath The path you wish to whitelist.
/// @param {real} type The type of whitelist. Default is `PlaypenFlag.BOTH`.
function PlaypenWhitelistAdd(_path, _type = PlaypenFlag.BOTH) {
	static _global = __PlaypenSystem();

	__PlaypenTypeValidation(nameof(PlaypenWhitelistAdd), _type);

	array_push(_global.whitelist, {
		path: __PlaypenSanitise(_path),
		type: _type
	});
}