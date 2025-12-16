/// @desc Adds a image from disk or the web as a sprite.
/// @param {string} filepath The image to load.
/// @param {real} imgNum How many frames the image has. 1 for .gif.
/// @param {bool} removeBack Whether to remove the background image colour or not.
/// @param {bool} smooth Whether to smooth the image or not.
/// @param {real} xorig Where the x origin of the image is.
/// @param {real} yorig Where the y origin of the image is.
function PlaypenSpriteAdd(_filepath, _imgNum, _removeBack, _smooth, _xorig, _yorig) {
	if (GM_is_sandboxed) {
		return sprite_add(_filepath, _imgNum, _removeBack, _smooth, _xorig, _yorig);
	}

	if (string_starts_with(_filepath, "data:")) || (PlaypenIsWhitelisted(_filepath, PlaypenFlag.READ)) {
		return sprite_add(_filepath, _imgNum, _removeBack, _smooth, _xorig, _yorig);
	}

	__PlaypenTrace($"{nameof(PlaypenSpriteAdd)} - \"{_filepath}\" is not whitelisted!");

	if (__PLAYPEN_DEFAULT_FILESYSTEM_GM_BEHAVIOUR) {
		__PlaypenTrace($"{nameof(PlaypenSpriteAdd)} - Attempting to load from save & bundle area.");
		return sprite_add(working_directory + _filepath, _imgNum, _removeBack, _smooth, _xorig, _yorig);
	}
	return handle_parse("ref sprite -1");
}