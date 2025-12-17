# Playpen
Smart safe whitelist system for GameMaker games with a disabled sandbox.
This library has a couple core functions, and includes a bunch of generic helper functions for almost all file-related functions.

```
PlaypenWhitelistAdd(filepath, [type]) - Adds a filepath to the whitelist, with a specified type as per PlaypenFlag enum.
PlaypenWhitelistGetAll() - Returns an array of all filepaths in the whitelist
PlaypenWhitelistClear() - Clears the whitelist
PlaypenWhitelistRemove(filepath) - Removes a filepath from the whitelist
PlaypenIsWhitelisted(filepath), type - Returns whether the filepath in question is apart of the whitelist or not, with the associated flag of choice.
PlaypenWhitelistGetFlag(filepath) - Returns a flag if a path has been whitelisted. If there is no valid whitelist, it'll return PlaypenFlag.INVALID.
```

Flags:
```gml
PlaypenFlag.INVALID - Only used for whenever a flag is invalid. Cannot be used for searching or adding to the whitelist.
PlaypenFlag.READ - Only allows reading
PlaypenFlag.WRITE - Only allows writing
PlaypenFlag.BOTH - Allows both reading and writing
```

Example use:
```gml
buff = PlaypenBufferLoad("C:\\Users\\TabularElf\\Desktop\\hello.txt");
if (!buffer_exists(buff)) {
  PlaypenWhitelistAdd("C:\\Users\\TabularElf\\Desktop\\hello.txt");
  // OR for whitelisting `Desktop` and beyond...
  PlaypenWhitelistAdd("C:\\Users\\TabularElf\\Desktop\\");

  buff = PlaypenBufferLoad("C:\\Users\\TabularElf\\Desktop\\hello.txt");
}

if (!buffer_exists(buff)) {
  show_error("File failed to load!", true);
}

var _str = buffer_read(buff, buffer_text);
show_message(_str);
buffer_delete(_buff);
```

## Note
This system does have a fallback mode for anything not apart of the whitelist in some contexts, and will attempt to work on either the "safe" save area or the working directory. (This is critically important in cases where on macOS and Linux, the whitelist system may not be able to properly determine that the relative path provided is valid.)

This also defaults to allowing all of the usual GameMaker paths. (`working_directory`, `game_save_id`,  `cache_directory`, `program_directory`,  `temp_directory`)
