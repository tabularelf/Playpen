/// @desc This function will delete the specified file.
/// @param {string} filepath The file you wish to delete.
/// @returns {bool} 
function PlaypenFileDelete(_filepath) {
	if (GM_is_sandboxed) {
		return __PlaypenFileDelete(_filepath);
	}

	if (PlaypenIsWhitelisted(_filepath, PlaypenFlag.WRITE)) {
		return __PlaypenFileDelete(_filepath);
	}

	__PlaypenTrace($"{nameof(PlaypenFileDelete)} - \"{_filepath}\" is not whitelisted!");
	return false;
}