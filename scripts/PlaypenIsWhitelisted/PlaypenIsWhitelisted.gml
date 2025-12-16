/// @desc This function checks whether the filepath or file is apart of the whitelist or not.
/// The following flags that can be passed and how they behave are:
/// `PlaypenFlag.READ` - Only searches for filepaths that are marked as `PlaypenFlag.READ` or `PlaypenFlag.BOTH`
/// `PlaypenFlag.WRITE` - Only searches for filepaths that are marked as `PlaypenFlag.WRITE` or `PlaypenFlag.BOTH`
/// `PlaypenFlag.BOTH` - Only searches for filepaths that are marked as `PlaypenFlag.BOTH`
/// @param {String} path The filepath to check.
/// @param {Enum.PlaypenFlag} type The type to look for.
/// @returns {Bool} 
function PlaypenIsWhitelisted(_path, _type) {
	static _global = __PlaypenSystem();
	static _ctx = {
		path: "",
		type: 0,
	};

	static _callback = method(_ctx, function(_elm) {
		return ((_elm.type == PlaypenFlag.BOTH) || (_elm.type == type)) && 
				string_starts_with(path, _elm.path);
	});

	__PlaypenTypeValidation(nameof(PlaypenIsWhitelisted), _type);

	_path = __PlaypenSanitise(_path);

	if (__PLAYPEN_DEFAULT_WHITELIST_INCLUDED) {
		// These are always allowed
		if (string_starts_with(_path, game_save_id) ||
			string_starts_with(_path, working_directory) || 
			string_starts_with(_path, program_directory) ||
			string_starts_with(_path, temp_directory) ||
			string_starts_with(_path, cache_directory)
		) {
			return true;
		}
    	
		if (string_pos("\\\\", _path) == 0) && (string_pos(":", _path) == 0) && (!string_starts_with("/", _path)) {
			// Probably in "safe" save area or bundle area... Allow it.
			return true;
		}
    	
		// Make sure that it isn't the root directory
		if (_path == "/") {
			return false;
		}
	}

	_ctx.path = _path;
	_ctx.type = _type;
	var _index = array_find_index(_global.whitelist, _callback);

	if (_index != -1) {
		return true;
	}

	return false;
}