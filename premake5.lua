
project "imgui"
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"
    staticruntime "off"

    files {
        "imconfig.h",
        "imgui.h",
        "imgui.cpp",
        "imgui_draw.cpp",
        "imgui_tables.cpp",
        "imgui_widgets.cpp",
        "imgui_demo.cpp",
        "imgui_internal.h",
        "backends/imgui_impl_glfw.cpp",
        "backends/imgui_impl_glfw.h",
        "backends/imgui_impl_vulkan.cpp",
        "backends/imgui_impl_vulkan.h",
    }

    includedirs {
        "%{wks.location}/Vendor/imgui",
        "%{wks.location}/Vendor/imgui/backends",
        "%{IncludeDir.VulkanSDK}",
        "%{IncludeDir.glfw}",
    }

    filter "system:windows"
        targetdir ("%{wks.location}/Binaries/windows-x86_64-%{cfg.buildcfg}/%{prj.name}")
        objdir    ("%{wks.location}/Binaries/Intermediates/windows-x86_64-%{cfg.buildcfg}/%{prj.name}")

    filter "system:windows"
        systemversion "latest"
        defines { "WIN32", "_WINDOWS" }

    filter "configurations:Debug"
        runtime "Debug"
        symbols "On"

    filter "configurations:Release"
        runtime "Release"
        optimize "Full"

    filter {}
