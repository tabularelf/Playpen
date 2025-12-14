function PlaypenSpriteAdd(_filepath, _imgNum, _removeBack, _smooth, _xorig, _yorig) {
	if (GM_is_sandboxed) {
		return sprite_add(_filepath, _imgNum, _removeBack, _smooth, _xorig, _yorig);
	}

	if (string_starts_with(_filepath, "data:")) || (PlaypenIsWhitelisted(_filepath)) {
		return sprite_add(_filepath, _imgNum, _removeBack, _smooth, _xorig, _yorig);
	}

	__PlaypenTrace($"{nameof(PlaypenSpriteAdd)} - \"{_filepath}\" is not whitelisted!");

	if (__PLAYPEN_DEFAULT_FILESYSTEM_GM_BEHAVIOUR) {
		__PlaypenTrace($"{nameof(PlaypenSpriteAdd)} - Attempting to load from save & bundle area.");
		return sprite_add(working_directory + _filepath, _imgNum, _removeBack, _smooth, _xorig, _yorig);
	}
	return handle_parse("ref sprite -1");
}