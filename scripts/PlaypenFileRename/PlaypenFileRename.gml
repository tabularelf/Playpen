function PlaypenFileRename(_filepath, _newFilepath) {
	if (GM_is_sandboxed) {
		return file_copy(_filepath, _newFilepath);
	}

	if (PlaypenIsWhitelisted(_filepath, PlaypenFlag.WRITE)) {
		return file_rename(_filepath, _newFilepath);
	}

	
	__PlaypenTrace($"{nameof(PlaypenFileRename)} - \"{_filepath}\" is not whitelisted!");
	return false;
}