/// @desc Function Description
/// @param {string} zipPath Description
/// @param {string} filepath Description
/// @returns {real} 
function PlaypenZipUnzip(_zipPath, _filepath) {
	if (GM_is_sandboxed) {
		return zip_unzip(_zipPath, _filepath);
	}

	var _filepathValidated = PlaypenIsWhitelisted(_zipPath, PlaypenFlag.READ);
	var _newFilepathValidated = PlaypenIsWhitelisted(_filepath, PlaypenFlag.WRITE);

	if (_filepathValidated && _newFilepathValidated) {
		return zip_unzip(_zipPath, _filepath);
	}

	if (!_filepathValidated) {
		__PlaypenTrace($"{nameof(PlaypenZipUnzip)} - \"{_zipPath}\" is not whitelisted!");
	}

	if (!_newFilepathValidated) {
		__PlaypenTrace($"{nameof(PlaypenZipUnzip)} - \"{_filepath}\" is not whitelisted!");
	}

	if (__PLAYPEN_DEFAULT_FILESYSTEM_GM_BEHAVIOUR) {
		__PlaypenTrace($"{nameof(PlaypenZipUnzip)} - Attempting to unzip from {working_directory + _zipPath} to \"{game_save_id + _filepath}\".");
		return zip_unzip(working_directory + _zipPath, game_save_id + _filepath);
	}
}