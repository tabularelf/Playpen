/*
 	When enabled, this ensures that in the event that the file system cannot find a file, 
	it'll attempt to fallback to what GameMaker may assume is what you want to do.
 	Which where instead of just not doing anything, it'll go by the absolute worse case scenario, 
	and run calls to the save area & bundle area.
	This is not as big of a deal on Windows, but might be more beneficial on macOS and Linux. 
*/
#macro __PLAYPEN_DEFAULT_FILESYSTEM_GM_BEHAVIOUR true
/*
	When enabled, Playpen will include the most basic whitelist rules and allow relative filepaths.
 	This also ensures that there is no root directory access on macOS and Linux.
	Note: These whitelist rules cannot be removed at all if enabled, and they do not appear in the whitelist itself.
 	These will be instead apart of "PlaypenIsWhitelisted" directly.
 	The following paths that will always be allowed:
	- cache_directory
 	- working_directory
 	- temp_directory
 	- program_directory
 	- game_save_id
*/
#macro __PLAYPEN_DEFAULT_WHITELIST_INCLUDED true