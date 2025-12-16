/// @desc This function generates a unique MD5 hash for the given file which can be stored for later use.
/// @param {string} filepath The file you wish to hash.
function PlaypenMd5File(_filepath) {
	if (GM_is_sandboxed) {
		return md5_file(_filepath);
	}

	if (PlaypenIsWhitelisted(_filepath, PlaypenFlag.READ)) {
		return md5_file(_filepath);
	}

	__PlaypenTrace($"{nameof(PlaypenMd5File)} - \"{_filepath}\" is not whitelisted!");

	if (__PLAYPEN_DEFAULT_FILESYSTEM_GM_BEHAVIOUR) {
		__PlaypenTrace($"{nameof(PlaypenMd5File)} - Attempting to hash from save & bundle area.");
		return md5_file(working_directory + _filepath);
	}
	return -1;
}