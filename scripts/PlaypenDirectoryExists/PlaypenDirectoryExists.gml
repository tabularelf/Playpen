/// @desc Function Description
/// @param {string} filepath Description
/// @returns {bool} Description
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