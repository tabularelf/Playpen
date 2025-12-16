/// @desc Saves a buffer to disk as a file.
/// @param {id.buffer} buff The buffer to save.
/// @param {string} filepath The filepath to save the buffer to.
/// @param {real} offset The offset of the buffer.
/// @param {real} size The size of the buffer.
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