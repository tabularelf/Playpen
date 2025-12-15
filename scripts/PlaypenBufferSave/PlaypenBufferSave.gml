/// @desc Function Description
/// @param {id.buffer} buff Description
/// @param {string} filepath Description
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