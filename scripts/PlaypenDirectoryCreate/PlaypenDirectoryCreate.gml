/// @desc Creates a new directory.
/// @param {string} filepath The filepath to create the new directory.
/// @return {Bool}
function PlaypenDirectoryCreate(_filepath) {
	if (GM_is_sandboxed) {
		return __PlaypenDirectoryCreate(_filepath);
	}

	if (PlaypenIsWhitelisted(_filepath, PlaypenFlag.WRITE)) {
		return __PlaypenDirectoryCreate(_filepath);
	}

	__PlaypenTrace($"{nameof(PlaypenDirectoryCreate)} - \"{_filepath}\" is not whitelisted!");
	return false;
}