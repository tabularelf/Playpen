/// @desc Takes a screenshot of the game and saves it to disk.
/// @param {string} filepath The filepath to save it to.
function PlaypenScreenSave(_filepath) {
	if (GM_is_sandboxed) {
		return screen_save(_filepath);
	}

	if (PlaypenIsWhitelisted(_filepath, PlaypenFlag.WRITE)) {
		return screen_save(_filepath);
	}

	__PlaypenTrace($"{nameof(PlaypenScreenSave)} - \"{_filepath}\" is not whitelisted!");

	if (__PLAYPEN_DEFAULT_FILESYSTEM_GM_BEHAVIOUR) {
		__PlaypenTrace($"{nameof(PlaypenScreenSave)} - Attempting to save at \"{game_save_id + _filepath}\".");
		return screen_save(game_save_id + _filepath);
	}
}