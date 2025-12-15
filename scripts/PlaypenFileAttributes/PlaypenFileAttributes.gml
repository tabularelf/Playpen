// feather ignore all
/// @desc Returns if the file in question has a specific attribute or not. (Windows only, returns false on all other platforms)
/// @param {String} filepath The filepath to check
/// @param {Constant.FileAttribute} attribute The attribute to check
/// @returns {Bool} 
function PlaypenFileAttribute(_filepath, _attribute) {
	if (!__PLAYPEN_ON_WINDOWS) {
		return false;
	}

	if (GM_is_sandboxed) {
		return file_attributes(_filepath, _attribute);
	}

	if (PlaypenIsWhitelisted(_filepath, PlaypenFlag.READ)) {
		return file_attributes(_filepath, _attribute);
	}

	__PlaypenTrace($"{nameof(PlaypenFileAttribute)} - \"{_filepath}\" is not whitelisted!");

	return false;
}