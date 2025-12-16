/// @desc Adds a image from disk or the web as a sprite. Fires off an async event.
/// @param {string} filepath The image to load from
/// @param {real} imgNum The number of frames this sprite has.
/// @param {real} xorig The x origin of the sprite.
/// @param {real} yorig The y origin of the sprite.
/// @param {bool} prefetch Whether the sprite should be loaded into GPU memory from the getgo.
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