function PlaypenSurfaceSave(_surf, _filepath) {
	if (GM_is_sandboxed) {
		return surface_save(_surf, _filepath);
	}

	if (PlaypenIsWhitelisted(_filepath)) {
		return surface_save(_surf, _filepath);
	}

	__PlaypenTrace($"{nameof(PlaypenSurfaceSave)} - \"{_filepath}\" is not whitelisted!");

	if (__PLAYPEN_DEFAULT_FILESYSTEM_GM_BEHAVIOUR) {
		__PlaypenTrace($"{nameof(PlaypenSurfaceSave)} - Attempting to save at \"{game_save_id + _filepath}\".");
		return surface_save(_surf, game_save_id + _filepath);
	}
	return -1;
}