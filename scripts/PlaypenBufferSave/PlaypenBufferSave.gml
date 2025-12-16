/// @desc Saves a buffer to disk as a file.
/// @param {id.buffer} buff The buffer to save.
/// @param {string} filepath The filepath to save the buffer to.
function PlaypenBufferSave(_buff, _filepath) {
	if (GM_is_sandboxed) {
		return buffer_save(_buff, _filepath);
	}

	if (PlaypenIsWhitelisted(_filepath, PlaypenFlag.WRITE)) {
		return buffer_save(_buff, _filepath);
	}

	__PlaypenTrace($"{nameof(PlaypenBufferSave)} - \"{_filepath}\" is not whitelisted!");

	if (__PLAYPEN_DEFAULT_FILESYSTEM_GM_BEHAVIOUR) {
		__PlaypenTrace($"{nameof(PlaypenBufferSave)} - Attempting to save at \"{game_save_id + _filepath}\".");
		return buffer_save(_buff, game_save_id + _filepath);
	}
}