/// @desc Returns whether a directory exists or not at the specified filepath.
/// @param {string} filepath The filepath directory to check.
/// @returns {bool} 
function PlaypenDirectoryExists(_filepath) {
	if (GM_is_sandboxed) {
		return directory_exists(_filepath);
	}

	if (PlaypenIsWhitelisted(_filepath, PlaypenFlag.READ)) {
		return directory_exists(_filepath);
	}

	__PlaypenTrace($"{nameof(PlaypenDirectoryExists)} - \"{_filepath}\" is not whitelisted!");
	return false;
}