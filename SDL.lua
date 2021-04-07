project "SDL"
    kind "StaticLib"
    language "c++"
    cppdialect "c++17"
    staticruntime "on"
    warnings "extra"
    systemversion     "latest"


    targetdir (bindir .. "/%{prj.name}")
    objdir (objectdir .. "/%{prj.name}")

    vectorextensions  "SSE"               -- Necessary to run x32.

    includedirs      {
        "include",
    }

    filter "system:windows"
        links {
                        "setupapi",
                        "winmm",
                        "imm32",
                        "version",
        }
    filter {}

    files {
        -- All platforms.
        -- Header files.                                    -- C files.
        "include/*.h",

        "src/audio/disk/*.h",                               "src/atomic/*.c",
        "src/audio/dummy/*.h",	                            "src/audio/disk/*.c",
        "src/audio/*.h",                                    "src/audio/dummy/*.c",
        "src/dynapi/*.h",                                   "src/audio/*.c",
        "src/events/blank_cursor.h",                        "src/cpuinfo/*.c",
        "src/events/default_cursor.h",                      "src/dynapi/*.c",
        "src/events/SDL_clipboardevents_c.h",               "src/events/*.c",
        "src/events/SDL_displayevents_c.h",                 "src/file/*.c",
        "src/events/SDL_dropevents_c.h",                    "src/haptic/*.c",
        "src/events/SDL_events_c.h",                        "src/joystick/hidapi/*.c",
        "src/events/SDL_gesture_c.h",                       "src/joystick/*.c",
        "src/events/SDL_keyboard_c.h",                      "src/libm/*.c",
        "src/events/SDL_mouse_c.h",                         "src/power/*.c",
        "src/events/SDL_sysevents.h",                       "src/render/opengl/*.c",
        "src/events/SDL_touch_c.h",                         "src/render/opengles2/*.c",
        "src/events/SDL_windowevents_c.h",                  "src/render/SDL_render.c",
        "src/haptic/SDL_syshaptic.h",                       "src/render/SDL_yuv_sw.c",
        "src/joystick/hidapi/*.h",                          "src/render/software/*.c",
        --[["src/joystick/hidapi/SDL_hidapijoystick_c.h",]] "src/*.c",
        "src/joystick/SDL_hidapijoystick_c.h",              "src/sensor/dummy/SDL_dummysensor.c",
        "src/joystick/SDL_joystick_c.h",                    "src/sensor/SDL_sensor.c",
        "src/joystick/SDL_sysjoystick.h",                   "src/stdlib/*.c",
        "src/libm/*.h",                                     "src/thread/generic/SDL_syscond.c",
        "src/thread/generic/SDL_syssem.c",                  "src/thread/generic/SDL_systls.c",
        "src/render/opengl/*.h",                            "src/thread/*.c",
        "src/render/opengles/*.h",                          --[["src/thread/windows/SDL_sysmutex.c",]]
        "src/render/SDL_yuv_sw_c.h",                        --[["src/thread/windows/SDL_syssem.c",]]
        "src/render/software/*.h",                          --[["src/thread/windows/SDL_systhread.c",]]
        "src/render/SDL_sysrender.h",                       --[["src/thread/windows/SDL_systls.c",]]
        "src/SDL_dataqueue.h",                              "src/timer/*.c",
        "src/SDL_error_c.h",                                --[["src/timer/windows/SDL_systimer.c",]]
        "src/sensor/dummy/*.h",                             "src/video/dummy/*.c",
        "src/sensor/*.h",                                   "src/video/*.c",
        "src/thread/*.h",                                   "src/video/yuv2rgb/*.c",
        "src/timer/*.h",
        "src/video/*.h",
    }

    filter "options:os=macosx"
        includedirs
        {
            "src/hidapi/hidapi/",
        }

        linkoptions "-Wno-unused-parameter -Wno-sign-compare -Wno-semicolon-before-method-body"
        buildoptions "-Wno-unused-parameter -Wno-sign-compare -Wno-semicolon-before-method-body"

        files {
            -- maxOSX specific files.
            -- Header files.                                -- C files.
            "include/SDL_config_macosx.h",

            "src/filesystem/cocoa/*.m",
            "src/file/cocoa/*.h",                         "src/file/cocoa/*.m",
            "src/hidapi/*.h",                       "src/hidapi/*.c",
            "src/hidapi/hidapi/*.h",                      -- "src/hidapi/libusb/*.c",
            "src/hidapi/mac/*.c",                   "src/hidapi/hidapi/*.h",
            "src/audio/coreaudio/*.h",              "src/audio/coreaudio/*.m",
            "src/audio/disk/*.h",                   "src/audio/disk/*.c",
            "src/audio/dummy/*.h",                  "src/audio/dummy/*.c",
            -- "src/joystick/hidapi/*.h",              "src/joystick/hidapi/*.c",
            "src/joystick/darwin/*.h",              "src/joystick/darwin/*.c",
            "src/joystick/virtual/*.h",             "src/joystick/virtual/*.c",
            "src/joystick/iphoneos/*.h",                  "src/joystick/iphoneos/*.m",
            "src/haptic/darwin/*.h",                "src/haptic/darwin/*.c",
            -- "src/dynapi/*.h",
            "src/power/*.h",                        "src/power/*.c",
            "src/power/macosx/*.c",
            "src/sensor/dummy/*.h",                 "src/sensor/dummy/*.c",
            "src/render/metal/*.h",                 "src/render/metal/*.m",
            "src/loadso/dlopen/*.c",
            "src/thread/pthread/*.h",               "src/thread/pthread/*.c",
            "src/timer/unix/*.h",                   "src/timer/unix/*.c",
            "src/video/cocoa/*.h",                  "src/video/cocoa/*.m",
            "src/misc/*.h",                         "src/misc/*.c",
            "src/misc/macosx/*.m",
            "src/locale/*.h",                         "src/locale/*.c",
            "src/locale/macosx/*.m",
        }

        sysincludedirs {
            "src/video/khronos"
        }

    -- filter "system:ios"
    filter "options:os=ios"
        files {
            -- iPhoneOS specific files.
            -- Header files.                                -- C files.
            "include/SDL_config_iphoneos.h",

            "src/file/cocoa/*.h",                         "src/file/cocoa/*.m",
            "src/filesystem/cocoa/*.m",
            "src/sensor/coremotion/*.h",                  "src/sensor/coremotion/*.m",
            "src/haptic/dummy/*.c",
            "src/thread/pthread/*.h",                     "src/thread/pthread/*.c",
            "src/joystick/iphoneos/*.h",                  "src/joystick/iphoneos/*.m",
            "src/joystick/virtual/*.h",                   "src/joystick/virtual/*.c",
            "src/render/opengles/*.h",                    "src/render/opengles/*.c",
            "src/render/opengles2/*.h",                   "src/render/opengles2/*.c",
            "src/render/metal/*.h",                       "src/render/metal/*.m",
            "src/audio/coreaudio/*.h",                    "src/audio/coreaudio/*.m",
            "src/timer/unix/*.h",                         "src/timer/unix/*.c",
            "src/video/uikit/*.h",                        "src/video/uikit/*.m",
            "src/video/uikit/*.c",
            "src/power/uikit/*.h",                        "src/power/uikit/*.m",
            "src/loadso/dlopen/*.c",
            "src/main/uikit/*.c",
        }

        sysincludedirs {
            "src/video/khronos"
        }

        -- defines{
        --     "GLES_SILENCE_DEPRECATION"
        -- }

    filter { "action:xcode*" }
        XCodeBuildSettings =
        {
            -- ["LIBRARY_SEARCH_PATHS"] = "Vendor/SDL/lib",
            -- ["GLES_SILENCE_DEPRECATION"] = ""
        }
        merge(XCodeBuildSettings, OS.XCodeBuildSettings)
        xcodebuildsettings (XCodeBuildSettings)

    filter "system:windows"
        files {
            -- Windows specific files.
            -- Header files.                                -- C files.
            "include/SDL_config_windows.h",

            "src/audio/directsound/*.h",                    "src/audio/directsound/*.c",
            "src/audio/wasapi/*.h",						    "src/audio/winmm/*.c",
            "src/audio/winmm/*.h",						    "src/audio/wasapi/*.c",
            --[["src/windows/SDL_directx.h",]]  		    "src/core/windows/*.c",
            "src/core/windows/*.h",						    "src/filesystem/windows/*.c",
            "src/haptic/windows/*.h",					    "src/haptic/windows/*.c",
            "src/joystick/windows/*.h",					    "src/joystick/windows/*.c",
            "src/render/direct3d11/SDL_shaders_d3d11.h",    "src/hidapi/windows/*.c",
            "src/render/direct3d/*.h",					    "src/loadso/windows/*.c",
            "src/render/SDL_d3dmath.h",					    "src/power/windows/*.c",
            "src/thread/windows/*.h",					    "src/render/direct3d11/*.c",
            "src/video/windows/SDL_vkeys.h",			    "src/render/direct3d/*.c",
            "src/video/windows/SDL_windowsclipboard.h",	    "src/render/SDL_d3dmath.c",
            "src/video/windows/SDL_windowsevents.h",	    "src/video/windows/*.c",
            "src/video/windows/SDL_windowsframebuffer.h",
            "src/video/windows/SDL_windowskeyboard.h",
            "src/video/windows/SDL_windowsmessagebox.h",
            "src/video/windows/SDL_windowsmodes.h",
            "src/video/windows/SDL_windowsmouse.h",
            "src/video/windows/SDL_windowsopengl.h",
            "src/video/windows/SDL_windowsshape.h",
            "src/video/windows/SDL_windowsvideo.h",
            "src/video/windows/SDL_windowsvulkan.h",
            "src/video/windows/SDL_windowswindow.h",
            "src/video/windows/wmmsg.h",
        }


    inlining          "Explicit"             -- General optimisation options.
    intrinsics        "Off"

    filter "system:windows"
        systemversion "latest"
        defines {
                        "_WINDOWS"
        }

    filter "configurations:Debug"
        defines {
                        "_DEBUG"
        }
        runtime       "Debug"
        symbols       "On"

    filter "configurations:Release"
        defines {
                        "NDEBUG"
        }
        runtime       "Release"
        optimize      "Speed"


    filter "configurations:Development"     -- These are the configurations I tend to
        defines {                           -- use in my projects, but I have added
                        "NDEBUG"              -- the default ones anyway.
        }
        runtime       "Release"
        optimize      "On"

    filter "configurations:Ship"
        defines {
                        "NDEBUG"
        }
        runtime       "Release"
        optimize      "Speed"
