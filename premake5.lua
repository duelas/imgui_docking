project "ImGui"
	kind "StaticLib"
	language "C++"
    staticruntime "off"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"imconfig.h",
		"imgui.h",
		"imgui.cpp",
		"imgui_draw.cpp",
		"imgui_internal.h",
		"imgui_tables.cpp",
		"imgui_widgets.cpp",
		"imstb_rectpack.h",
		"imstb_textedit.h",
		"imstb_truetype.h",
		"imgui_demo.cpp",
		"backends/imgui_impl_glfw.h",
		"backends/imgui_impl_glfw.cpp",
		"backends/imgui_impl_vulkan.h",
		"backends/imgui_impl_vulkan.cpp",
        "imgui_stdlib.h",
        "imgui_stdlib.cpp"
	}
	
	includedirs
	{
		"%{IncludeDir.GLFW}",
		"%{IncludeDir.VulkanSDK}"
	}
	
	filter "system:windows"
		systemversion "latest"
		cppdialect "C++17"

	filter "system:linux"
		pic "On"
		systemversion "latest"
		cppdialect "C++17"
		
		
	filter "configurations:Editor_Debug"
		runtime "Debug"
		symbols "On"		
		
	filter "configurations:Editor_Release"
		runtime "Release"
		optimize "On"
		symbols "off"
		
		
	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"
		postbuildcommands	{	"{COPYDIR} \"%{cfg.targetdir}/%{prj.name}.lib\" \"%{wks.location}/projectmodule/Lib\""	}
		
	filter "configurations:Release"
		runtime "Release"
		optimize "on"
		postbuildcommands	{	"{COPYDIR} \"%{cfg.targetdir}/%{prj.name}.lib\" \"%{wks.location}/projectmodule/Lib\""	}
		
    filter "configurations:Dist"
		runtime "Release"
		optimize "on"
        symbols "off"		
		postbuildcommands	{	"{COPYDIR} \"%{cfg.targetdir}/%{prj.name}.lib\" \"%{wks.location}/projectmodule/Lib\""	}
