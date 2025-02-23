"GameInfo"
{
	// ********************************************************************************
	// ********************************************************************************
	// ********************************************************************************
	// DO NOT EDIT THIS FILE DIRECTLY - YOU PROBABLY WANT TO EDIT CSGO_CORE/GAMEINFO.GI
	// ********************************************************************************
	// ********************************************************************************
	// ********************************************************************************

	game 		"Counter-Strike 2"
	title 		"Counter-Strike 2"
	
	LayeredOnMod	csgo_imported // Inherits the gameinfo.gi data from csgo_imported (which itself inherits from csgo_core)

	FileSystem
	{
		SearchPaths
		{
			Game_LowViolence	csgo_lv // Perfect World content override

			Game	csgo
			Game	csgo_imported
			Game	csgo_core
			Game	core

			Mod		csgo
			Mod		csgo_imported
			Mod		csgo_core

			AddonRoot			csgo_addons

			LayeredGameRoot		"../game_otherplatforms/etc" [$MOBILE || $ETC_TEXTURES] //Some platforms do not support DXT compression. ETC is a well-supported alternative.
			LayeredGameRoot		"../game_otherplatforms/low_bitrate" [$MOBILE]
		}

		"UserSettingsPathID"	"USRLOCAL"
		"UserSettingsFileEx"	"cs2_"
	}

	Engine2
	{
		"DepotBuildDateTimeInTitleBar" "1"
	}

	ConVars
	{
		// Bandwidth control default: 300,000 Bps
		"rate"
		{
			"min"		"98304"
			"default"	"786432"
			"max"		"1000000"
		}
		"sv_minrate"	"98304"

		"cl_interp_ratio"
		{
			"min"		"1"
			"max"		"2"
		}
		"cl_interp"
		{
			"min"		"0"
			"max"		"0.1"
		}
		// Don't set tick-rate related values here, as those should now all come from ENGINE_FIXED_TICK_INTERVAL

		// GOTV controls
		"tv_secret_code"		"0"
		"tv_relay_secret_code"	"0"
		"tv_update_hibernation_enabled" "0"

		// Performance
		"sv_parallel_checktransmit"		"2"
		"fps_max"		"400"
		"fps_max_ui"	"120"
		"r_add_views_in_pre_output"		"1"

		// Nav fixups
		"nav_path_fixup_climb_up_segments" "1"
		"nav_gen_agent_radius_buffer" "0.75"
		"nav_gen_jump_connection_min_overlap_ratio" "0.1"

		// CSM override
		"csm_slope_scale_db_override" "3"
		
		// SSAO customization for CSGO (this is used on viewmodels)
		"r_ssao_radius"				"8"
		"r_ssao_strength"			"3"
		"r_ssao_bias"				"2.5"

		// this cache kills performance due to mutex contention
		"bone_decode_cache_enabled" "0"

		// Disable warning about oscillating panorama classes
		"@panorama_classes_oscillation_warning" "0"

		// Spew warning when adding/removing classes to/from the top of the hierarchy
		"@panorama_classes_perf_warning_threshold_ms" "0.75"

		// Panorama - enable render target cache
		"@panorama_disable_render_target_cache" "0"

		// Panorama - enable minidumps on JS exceptions
		"panorama_js_minidumps" "1"

		// HLTV AutoDirector - disable it for now so that it doesn't interfere with our spectator camera during replays / hltv / demos
		// Needs to be revisited when we re-enable AutoDirector
		"spec_autodirector" "false"

		// Grass
		"r_grass_quality"				"3"
		"r_grass_alpha_test"			"1"
		"r_grass_density_mode"			"1"
		"r_grass_start_fade"			"3000"
		"r_grass_end_fade"				"3900"

		// Default to binding keys based on keyboard position instead of key name
		"input_button_code_is_scan_code"	"1"

		//Disable Cubemap Brightening
		"lb_cubemap_normalization_max" 		"1"

		// For low quality shaders, cubemap bounds are scaled by this percentage of the fade region
		"lb_low_quality_shader_fade_region_rescale"	"0.5"
		
		// Use normal quality compression even in MET, this makes compiles in MET slower than
		// the default of fastest (0), but reduces artifacts that are confusing to artists since 
		// it's not clear that texture compression quality is different in MET than when regularly compiled.
		"rc_default_texture_encode_quality" "2"

		// The engine default of 50 for CS:GO is too high, drop down to a more sensible 
		// default value.
		"mouse_pitchyaw_sensitivity"	"3"
		"pitch_extra_mouse_sensitivity"	"1.0"

		"r_size_cull_threshold"			"0.33"
		"r_size_cull_threshold_fade"	"7.5"
		"inferno_scorch_decals" "0"

		// Steam Audio project specific convars
		"snd_hrtf_distance_behind"				"400.0"
		"snd_steamaudio_enable_custom_hrtf"		"0"
		"snd_steamaudio_active_hrtf"			"0"
	}

	// Temporarily allowing this because the particle files that are tripping this up ALSO crash PET so I 
	// cannot fix them. We'll sort this out Monday 2/13/23.
	//ResourceCompiler
	//{
	//	// See csgo_imported's gameinfo.gi
	//	"DeprecatedBehaviorVersionsAllowed"	"0"
	//}
	
	GameInstructor
	{
		"SaveToSteamStats" "1"
	}

	CS2WorkshopManager
	{
		"RequiredTag" "CS2"
		"HighlightEntriesMissingRequiredTag" "1"
	}
	
	AssetBrowser
	{
		retail_filter0		"characters/models/"
		retail_filter1		"materials/decals/sprays/"
		retail_filter2		"panorama/"
		retail_filter3		"patches/"
		retail_filter4		"stickers/"
	}

	AddonConfig	
	{
		"VpkDirectories"
		{
			"dir"       "maps"
			"dir"       "cfg/maps"
			"dir"       "materials"
			"dir"       "models"
			"dir"       "panorama/images/overheadmaps"
			"dir"       "scripts/vscripts"
			"dir"       "sound"
		} 
	}
}
