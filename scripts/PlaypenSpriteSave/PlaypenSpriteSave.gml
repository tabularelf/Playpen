function PlaypenSpriteSave(_sprite, _subImg, _filepath) {
	if (GM_is_sandboxed) {
		return sprite_save(_sprite, _subImg, _filepath);
	}

	if (PlaypenIsWhitelisted(_filepath)) {
		return sprite_save(_sprite, _subImg, _filepath);
	}

	__PlaypenTrace($"{nameof(PlaypenSpriteSave)} - \"{_filepath}\" is not whitelisted!");

	if (__PLAYPEN_DEFAULT_FILESYSTEM_GM_BEHAVIOUR) {
		__PlaypenTrace($"{nameof(PlaypenSpriteSave)} - Attempting to save at \"{game_save_id + _filepath}\".");
		return sprite_save(_sprite, _subImg, game_save_id + _filepath);
	}
}