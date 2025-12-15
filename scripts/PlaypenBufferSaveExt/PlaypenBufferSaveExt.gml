/// @desc Function Description
/// @param {id.buffer} buff Description
/// @param {string} filepath Description
/// @param {real} offset Description
/// @param {real} size Description
function PlaypenBufferSaveExt(_buff, _filepath, _offset, _size) {
	if (GM_is_sandboxed) {
		return buffer_save_ext(_buff, _filepath, _offset, _size);
	}

	if (PlaypenIsWhitelisted(_filepath, PlaypenFlag.WRITE)) {
		return buffer_save_ext(_buff, _filepath, _offset, _size);
	}

	__PlaypenTrace($"{nameof(PlaypenBufferSave)} - \"{_filepath}\" is not whitelisted!");

	if (__PLAYPEN_DEFAULT_FILESYSTEM_GM_BEHAVIOUR) {
		__PlaypenTrace($"{nameof(PlaypenBufferSaveExt)} - Attempting to save at \"{game_save_id + _filepath}\".");
		return buffer_save_ext(_buff, game_save_id + _filepath, _offset, _size);
	}
}