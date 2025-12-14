# Playpen
Smart safe whitelist system for GameMaker games with a disabled sandbox.

```
PlaypenWhitelistAdd(filepath) - Adds a filepath to the whitelist
PlaypenWhitelistGetAll() - Returns an array of all filepaths accepted
PlaypenWhitelistClear() - Clears the whitelist
PlaypenWhitelistRemove(filepath) - Removes a filepath from the whitelist
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

var _str = buffer_read(buff);
show_message(_str);
buffer_delete(_buff);
```

## Note
This system does have a fallback mode for anything not apart of the whitelist in some contexts, and will attempt to work on either the "safe" save area or the working directory. (This is critically important in cases where on macOS and Linux, the whitelist system may not be able to properly determine that the relative path provided is valid.)

This also defaults to allowing all of the usual GameMaker paths. (`working_directory`, `game_save_id`,  `cache_directory`, `program_directory`,  `temp_directory`)
