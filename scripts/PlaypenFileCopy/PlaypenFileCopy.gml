/// @desc This function will copy the specified file, to a separate location.
/// @param {String} filepath The file to copy from
/// @param {String} newFilepath The file to copy to
/// @return {Bool}
function PlaypenFileCopy(_filepath, _newFilepath) {
	if (GM_is_sandboxed) {
		return __PlaypenFileCopy(_filepath, _newFilepath);
	}

	var _filepathValidated = PlaypenIsWhitelisted(_filepath, PlaypenFlag.READ);
	var _newFilepathValidated = PlaypenIsWhitelisted(_newFilepath, PlaypenFlag.WRITE);

	if (_filepathValidated && _newFilepathValidated) {
		return __PlaypenFileCopy(_filepath, _newFilepath);
	}

	if (!_filepathValidated) {
		__PlaypenTrace($"{nameof(PlaypenFileCopy)} - \"{_filepath}\" is not whitelisted!");
	}

	if (!_newFilepathValidated) {
		__PlaypenTrace($"{nameof(PlaypenFileCopy)} - \"{_newFilepath}\" is not whitelisted!");
	}

	if (__PLAYPEN_DEFAULT_FILESYSTEM_GM_BEHAVIOUR) {
		__PlaypenTrace($"{nameof(PlaypenFileCopy)} - Attempting to copy from {working_directory + _filepath} to \"{game_save_id + _newFilepath}\".");
		return __PlaypenFileCopy(
			_filepathValidated ? _filepath : working_directory + _filepath, 
			_newFilepathValidated ? _newFilepath : game_save_id + _newFilepath
		);
	}

	return false;
}