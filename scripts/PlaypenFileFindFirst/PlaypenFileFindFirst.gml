// feather ignore all
/// @desc Starts and returns a file. If the folder is empty, or is not whitelisted, an empty string will be returned.
/// @param {String} filepath The filepath to start searching from
/// @param {Constant.FileAttribute} attribute The attribute to include, if any
/// @returns {String} 
function PlaypenFileFindFirst(_filepath, _attribute) {
	if (GM_is_sandboxed) {
		return file_find_first(_filepath, _attribute);
	}

	if (PlaypenIsWhitelisted(_filepath, PlaypenFlag.READ)) {
		return file_find_first(_filepath, _attribute);
	}

	__PlaypenTrace($"{nameof(PlaypenFileFindFirst)} - \"{_filepath}\" is not whitelisted!");

	return "";
}