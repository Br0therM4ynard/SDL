workspace "SDL"
	-- location         ""

	configurations {
		             "Debug",
		             "Release"
	}

	platforms {
		             "x32",
		             "x64"
	}

	filter "platforms:x32"
		architecture "x32"

	filter "platforms:x64"
		architecture "x64"

	-- filter{}
    -- {
    --     "Cocoa.framework",
    --     "ForceFeedback.framework",
    --     "IOKit.framework",
    --     "Carbon.framework",
    --     "Foundation.framework",
    --     "QuartzCore.framework",
    --     "CoreHaptics.framework",
    --     "Metal.framework",
    --     "AVFoundation.framework",
    --     "CoreMotion.framework",
    --     "GameController.framework",
    --     "CoreAudio.framework",
    --     "AudioToolbox.framework",
    --     "CoreGraphics.framework",
    --     "OpenGL.framework",
    -- }

include "SDL.lua"

-- filter "system:windows"                 -- Only needed on Windows for WinMain().
	-- include "SDLmain.lua"
