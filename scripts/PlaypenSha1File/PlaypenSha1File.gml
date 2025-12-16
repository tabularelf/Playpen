/// @desc This function will take an input file and return a 160 bit hash value in ASCII format unique to that file to be used for integrity verification at any later date.
/// @param {string} filepath The file you wish to hash.
function PlaypenSha1File(_filepath) {
	if (GM_is_sandboxed) {
		return sha1_file(_filepath);
	}

	if (PlaypenIsWhitelisted(_filepath, PlaypenFlag.READ)) {
		return sha1_file(_filepath);
	}

	__PlaypenTrace($"{nameof(PlaypenSha1File)} - \"{_filepath}\" is not whitelisted!");

	if (__PLAYPEN_DEFAULT_FILESYSTEM_GM_BEHAVIOUR) {
		__PlaypenTrace($"{nameof(PlaypenSha1File)} - Attempting to hash from save & bundle area.");
		return sha1_file(working_directory + _filepath);
	}
	return -1;
}