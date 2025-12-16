/// @desc Loads the buffer into memomry from the specified filepath, into the specified buffer.
/// @param {id.buffer} buff Description
/// @param {string} filepath Description
/// @param {real} offset Description
function PlaypenBufferLoadExt(_buff, _filepath, _offset) {
	if (GM_is_sandboxed) {
		return buffer_load_ext(_buff, _filepath, _offset);
	}

	if (PlaypenIsWhitelisted(_filepath, PlaypenFlag.READ)) {
		return buffer_load_ext(_buff, _filepath, _offset);
	}

	__PlaypenTrace($"{nameof(PlaypenBufferLoadExt)} - \"{_filepath}\" is not whitelisted!");
	__PlaypenTrace($"{nameof(PlaypenBufferLoadAsync)} - \"{_filepath}\" is not whitelisted!");
	if (__PLAYPEN_DEFAULT_FILESYSTEM_GM_BEHAVIOUR) {
		__PlaypenTrace($"{nameof(PlaypenBufferLoadExt)} - Attempting to load from save & bundle area.");
		return buffer_load_ext(_buff, working_directory + _filepath, _offset);
	}
}