/// @desc Function Description
/// @param {string} filepath Description
/// @param {real} imgNum Description
/// @param {real} xorig Description
/// @param {real} yorig Description
/// @param {bool} prefetch Description
function PlaypenSpriteAddExt(_filepath, _imgNum, _xorig, _yorig, _prefetch) {
	if (GM_is_sandboxed) {
		return sprite_add_ext(_filepath, _imgNum, _xorig, _yorig, _prefetch);
	}

	if (string_starts_with(_filepath, "data:")) || (PlaypenIsWhitelisted(_filepath, PlaypenFlag.READ)) {
		return PlaypenSpriteAddExt(_filepath, _imgNum, _xorig, _yorig, _prefetch);
	}

	__PlaypenTrace($"{nameof(PlaypenSpriteAddExt)} - \"{_filepath}\" is not whitelisted!");

	if (__PLAYPEN_DEFAULT_FILESYSTEM_GM_BEHAVIOUR) {
		__PlaypenTrace($"{nameof(PlaypenSpriteAddExt)} - Attempting to load from save & bundle area.");
		return sprite_add_ext(working_directory + _filepath, _imgNum, _xorig, _yorig, _prefetch);
	}
	return -1;
}