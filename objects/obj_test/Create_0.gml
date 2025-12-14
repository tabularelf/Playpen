call_later(1, time_source_units_seconds, function() {
	show_debug_message($"PlaypenFileExists(\"test.txt\") - {PlaypenFileExists("test.txt")}");
	show_debug_message($"PlaypenFileExists(\"world.txt\") - {PlaypenFileExists("world.txt")}");
	show_debug_message($"PlaypenFileExists(\"hello\\world.txt\") - {PlaypenFileExists("hello\\world.txt")}");
	show_debug_message($"PlaypenFileExists(\"hello/world.txt\") - {PlaypenFileExists("hello/world.txt")}");
	show_debug_message($"PlaypenFileExists(\"T:/TabularElf/Desktop/Hex for vtube.txt\") - {PlaypenFileExists("T:/TabularElf/Desktop/Hex for vtube.txt")}");
});