function PlaypenBufferLoadAsync(_buff, _filepath, _offset, _size) {
	if (GM_is_sandboxed) {
		return buffer_load_async(_buff, _filepath, _offset, _size);
	}

	if (PlaypenIsWhitelisted(_filepath)) {
		return buffer_load_async(_buff, _filepath, _offset, _size);
	}

	__PlaypenTrace($"{nameof(PlaypenBufferLoadAsync)} - \"{_filepath}\" is not whitelisted!");
	if (__PLAYPEN_DEFAULT_FILESYSTEM_GM_BEHAVIOUR) {
		__PlaypenTrace($"{nameof(PlaypenBufferLoadAsync)} - Attempting to load from save & bundle area.");
		return buffer_load_async(_buff, working_directory + _filepath, _offset, _size);
	}
	return -1;
}