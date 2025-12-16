/// @desc This function connects to the specified URL in order to retrieve information in the form of a file.
/// @param {String} url The web address of the server you wish to get the file from.
/// @param {String} filepath The local storage path to save to.
/// @returns {Real} 
function PlaypenHttpGetFile(_url, _filepath) {
	if (GM_is_sandboxed) {
		return http_get_file(_url, _filepath);
	}

	if (PlaypenIsWhitelisted(_filepath, PlaypenFlag.WRITE)) {
		return http_get_file(_url, _filepath);
	}

	__PlaypenTrace($"{nameof(PlaypenHttpGetFile)} - \"{_filepath}\" is not whitelisted!");

	if (__PLAYPEN_DEFAULT_FILESYSTEM_GM_BEHAVIOUR) {
		__PlaypenTrace($"{nameof(PlaypenHttpGetFile)} - Attempting to download at \"{game_save_id + _filepath}\".");
		return http_get_file(_url, game_save_id + _filepath);
	}
	return -1;
}