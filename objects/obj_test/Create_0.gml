call_later(1, time_source_units_seconds, function() {
	show_debug_message($"PlaypenFileExists(\"test.txt\") - {PlaypenFileExists("test.txt")}");
	show_debug_message($"PlaypenFileExists(\"world.txt\") - {PlaypenFileExists("world.txt")}");
	show_debug_message($"PlaypenFileExists(\"hello\\world.txt\") - {PlaypenFileExists("hello\\world.txt")}");
	show_debug_message($"PlaypenFileExists(\"hello/world.txt\") - {PlaypenFileExists("hello/world.txt")}");
	show_debug_message($"PlaypenFileExists(\"T:/TabularElf/Desktop/Hex for vtube.txt\") - {PlaypenFileExists("T:/TabularElf/Desktop/Hex for vtube.txt")}");

	PlaypenWhitelistAdd("T:/TabularElf/Desktop/Hex for vtube.txt");
	//PlaypenWhitelistAdd("/Users/TabularElf/");
	var _buff = buffer_create(1, buffer_grow, 1);
	buffer_write(_buff, buffer_text, "Hello, world!");
	PlaypenBufferSave(_buff, "/Users/tabularelf/test.txt");
	buffer_delete(_buff);
	show_debug_message($"PlaypenFileExists(\"T:/TabularElf/Desktop/Hex for vtube.txt\") - {PlaypenFileExists("T:/TabularElf/Desktop/Hex for vtube.txt")}");
	show_debug_message($"PlaypenFileExists(\"T:/TabularElf/Desktop/aggressive_whale_noises.png\") - {PlaypenFileExists("T:/TabularElf/Desktop/aggressive_whale_noises.png")}");
});