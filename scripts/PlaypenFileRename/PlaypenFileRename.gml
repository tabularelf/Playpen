/// @desc Function Description
/// @param {string} filepath Description
/// @param {string} newFilepath Description
/// @returns {bool} Description
function PlaypenFileRename(_filepath, _newFilepath) {
	if (GM_is_sandboxed) {
		return __PlaypenFileRename(_filepath, _newFilepath);
	}

	if (PlaypenIsWhitelisted(_filepath, PlaypenFlag.WRITE)) {
		return __PlaypenFileRename(_filepath, _newFilepath);
	}

	
	__PlaypenTrace($"{nameof(PlaypenFileRename)} - \"{_filepath}\" is not whitelisted!");
	return false;
}