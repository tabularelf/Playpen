function PlaypenFileCopy(_filepath, _newFilepath) {
	if (GM_is_sandboxed) {
		return file_copy(_filepath, _newFilepath);
	}

	var _filepathValidated = PlaypenIsWhitelisted(_filepath, PlaypenFlag.READ);
	var _newFilepathValidated = PlaypenIsWhitelisted(_newFilepath, PlaypenFlag.WRITE);

	if (_filepathValidated && _newFilepathValidated) {
		return file_copy(_filepath, _newFilepath);
	}

	if (!_filepathValidated) {
		__PlaypenTrace($"{nameof(PlaypenFileCopy)} - \"{_filepath}\" is not whitelisted!");
	}

	if (!_newFilepathValidated) {
		__PlaypenTrace($"{nameof(PlaypenFileCopy)} - \"{_newFilepath}\" is not whitelisted!");
	}

	if (__PLAYPEN_DEFAULT_FILESYSTEM_GM_BEHAVIOUR) {
		__PlaypenTrace($"{nameof(PlaypenFileCopy)} - Attempting to copy to \"{game_save_id + _newFilepath}\".");
		return file_copy(_filepath, game_save_id + _newFilepath);
	}
}