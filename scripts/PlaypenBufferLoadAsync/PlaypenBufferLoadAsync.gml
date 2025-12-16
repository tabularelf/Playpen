/// @desc Loads the buffer into memomry asynchronously from the specified filepath, into the specified buffer.
/// @param {id.buffer} buff The target buffer to load into.
/// @param {string} filepath The filepath you wish to load from.
/// @param {real} offset The offset of where to load to in the buffer.
/// @param {real} size The size of the data you wish to load.
/// @returns {real} Description
function PlaypenBufferLoadAsync(_buff, _filepath, _offset, _size) {
	if (GM_is_sandboxed) {
		return buffer_load_async(_buff, _filepath, _offset, _size);
	}

	if (PlaypenIsWhitelisted(_filepath, PlaypenFlag.READ)) {
		return buffer_load_async(_buff, _filepath, _offset, _size);
	}

	__PlaypenTrace($"{nameof(PlaypenBufferLoadAsync)} - \"{_filepath}\" is not whitelisted!");
	if (__PLAYPEN_DEFAULT_FILESYSTEM_GM_BEHAVIOUR) {
		__PlaypenTrace($"{nameof(PlaypenBufferLoadAsync)} - Attempting to load from save & bundle area.");
		return buffer_load_async(_buff, working_directory + _filepath, _offset, _size);
	}
	return -1;
}