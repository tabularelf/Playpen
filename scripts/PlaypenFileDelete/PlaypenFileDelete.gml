function PlaypenFileDelete(_filepath) {
	if (GM_is_sandboxed) {
		return file_delete(_filepath);
	}

	if (PlaypenIsWhitelisted(_filepath, PlaypenFlag.WRITE)) {
		return file_delete(_filepath);
	}

	__PlaypenTrace($"{nameof(PlaypenFileDelete)} - \"{_filepath}\" is not whitelisted!");
	return false;
}