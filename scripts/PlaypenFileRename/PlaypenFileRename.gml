/// @desc This function renames the specified file to the new name.
/// @param {string} filepath The file you wish to target.
/// @param {string} newName What you wish to change the name to.
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