/// @desc This saves the current sprite with the specified sub image, to the specified filepath.
/// @param {asset.gmsprite} sprite Sprite to save.
/// @param {real} subImg Sprite image index to save.
/// @param {string} filepath The filepath to save at.
function PlaypenSpriteSave(_sprite, _subImg, _filepath) {
	if (GM_is_sandboxed) {
		return sprite_save(_sprite, _subImg, _filepath);
	}

	if (PlaypenIsWhitelisted(_filepath, PlaypenFlag.WRITE)) {
		return sprite_save(_sprite, _subImg, _filepath);
	}

	__PlaypenTrace($"{nameof(PlaypenSpriteSave)} - \"{_filepath}\" is not whitelisted!");

	if (__PLAYPEN_DEFAULT_FILESYSTEM_GM_BEHAVIOUR) {
		__PlaypenTrace($"{nameof(PlaypenSpriteSave)} - Attempting to save at \"{game_save_id + _filepath}\".");
		return sprite_save(_sprite, _subImg, game_save_id + _filepath);
	}
}