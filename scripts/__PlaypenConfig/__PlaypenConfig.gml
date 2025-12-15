/*
 	When enabled, this ensures that in the event that the file system cannot find a file, it'll attempt to fallback to what GameMaker may assume is what you want to do.
 	Which where instead of just not doing anything, it'll go by the absolute worse case scenario, and run calls to the save area & bundle area.
	This is not as big of a deal on Windows, but might be more beneficial on macOS and Linux. 
*/
#macro __PLAYPEN_DEFAULT_FILESYSTEM_GM_BEHAVIOUR true