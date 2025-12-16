/// @desc Loads the buffer into memomry from the specified filepath, into the specified buffer.
/// @param {id.buffer} buff The buffer to load into.
/// @param {string} filepath The filepath to load from.
/// @param {real} srcOffset The source offset of the file buffer to read from.
/// @param {real} srcLen The source length of the file buffer to read to.
/// @param {real} destOffset The offset of the buffer specified to load into.
/// @returns {real} Description
function PlaypenBufferLoadPartial(_buff, _filepath, _srcOffset, _srcLen, _destOffset) {
	if (GM_is_sandboxed) {
		return buffer_load_partial(_buff, _filepath, _srcOffset, _srcLen, _destOffset);
	}

	if (PlaypenIsWhitelisted(_filepath, PlaypenFlag.READ)) {
		return buffer_load_partial(_buff, _filepath, _srcOffset, _srcLen, _destOffset);
	}

	__PlaypenTrace($"{nameof(PlaypenBufferLoadPartial)} - \"{_filepath}\" is not whitelisted!");
	if (__PLAYPEN_DEFAULT_FILESYSTEM_GM_BEHAVIOUR) {
		__PlaypenTrace($"{nameof(PlaypenBufferLoadPartial)} - Attempting to load from save & bundle area.");
		return buffer_load_partial(_buff, working_directory + _filepath, _srcOffset, _srcLen, _destOffset);
	}
}