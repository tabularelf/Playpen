function PlaypenIsWhitelisted(_path) {
	static _global = __PlaypenSystem();
	static _ctx = {
		path: "",
	};

	static _callback = method(_ctx, function(_path) {
		return string_starts_with(path, _path);
	});

	_path = __PlaypenSanitise(_path);

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

	_ctx.path = _path;
	var _index = array_find_index(_global.whitelist, _callback);

	if (_index != -1) {
		return true;
	}

	return false;
}