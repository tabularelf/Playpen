/// @desc Loads the buffer into memomry from the specified filepath.
/// @param {string} filepath The filepath to load from.
function PlaypenBufferLoad(_filepath) {
	if (GM_is_sandboxed) {
		return buffer_load(_filepath);
	}

	if (PlaypenIsWhitelisted(_filepath, PlaypenFlag.READ)) {
		return buffer_load(_filepath);
	}

	__PlaypenTrace($"{nameof(PlaypenBufferLoad)} - \"{_filepath}\" is not whitelisted!");

	if (__PLAYPEN_DEFAULT_FILESYSTEM_GM_BEHAVIOUR) {
		__PlaypenTrace($"{nameof(PlaypenBufferLoad)} - Attempting to load from save & bundle area.");
		return buffer_load(working_directory + _filepath);
	}
	return handle_parse("ref buffer -1");
}