/// @desc Function Description
/// @param {string} filepath Description
function PlaypenSha1File(_filepath) {
	if (GM_is_sandboxed) {
		return sha1_file(_filepath);
	}

	if (PlaypenIsWhitelisted(_filepath, PlaypenFlag.READ)) {
		return sha1_file(_filepath);
	}

	__PlaypenTrace($"{nameof(PlaypenSha1File)} - \"{_filepath}\" is not whitelisted!");

	if (__PLAYPEN_DEFAULT_FILESYSTEM_GM_BEHAVIOUR) {
		__PlaypenTrace($"{nameof(PlaypenSha1File)} - Attempting to hash from save & bundle area.");
		return sha1_file(working_directory + _filepath);
	}
	return -1;
}