/// @desc Function Description
/// @param {String} filepath Description
function PlaypenDirectoryDestroy(_filepath) {
	if (GM_is_sandboxed) {
		return directory_destroy(_filepath);
	}

	if (PlaypenIsWhitelisted(_filepath, PlaypenFlag.WRITE)) {
		return directory_destroy(_filepath);
	}

	__PlaypenTrace($"{nameof(PlaypenDirectoryDestroy)} - \"{_filepath}\" is not whitelisted!");
}