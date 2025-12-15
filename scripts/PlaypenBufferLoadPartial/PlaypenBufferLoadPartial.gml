/// @desc Function Description
/// @param {id.buffer} buff Description
/// @param {string} filepath Description
/// @param {real} srcOffset Description
/// @param {real} srcLen Description
/// @param {real} destOffset Description
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