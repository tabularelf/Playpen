// feather ignore all
/// @desc Returns whether a file exists or not, depending on the whitelist & sandbox rules.
/// @param {String} filepath The filepath to check
/// @returns {Bool} 
function PlaypenFileExists(_filepath) {
	if (GM_is_sandboxed) {
		return file_exists(_filepath);
	}

	if (PlaypenIsWhitelisted(_filepath)) {
		return file_exists(_filepath);
	}

	__PlaypenTrace($"{nameof(PlaypenFileExists)} - \"{_filepath}\" is not whitelisted!");

	if (__PLAYPEN_DEFAULT_FILESYSTEM_GM_BEHAVIOUR) {
		__PlaypenTrace($"{nameof(PlaypenFileExists)} - Attempting to check save & bundle area.");
		return file_exists(working_directory + _filepath);
	}

	return false;
}