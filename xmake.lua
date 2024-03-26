add_rules("mode.debug", "mode.release")
add_requires("libcurl", "openssl", "boost", {configs={context=true}})
set_languages("c99", "c++17")
set_optimize("smallest")

target("lithium-sandbox")
    set_kind("binary")
    add_files("src/*.cc", "src/**")
    
    add_includedirs("src")
    add_includedirs("/usr/lib/lithium/include")

    add_packages("libcurl", "openssl", "boost")    

    -- Link to threads
    add_syslinks("pthread")

    -- Custom command for symbols generation (equivalent to CMake's add_custom_target)
    after_build(function (target)
        os.exec("li_symbol_generator ${projectdir}")
    end)

-- @code
--    -- add debug and release modes
--    add_rules("mode.debug", "mode.release")
--
--    -- add macro definition
--    add_defines("NDEBUG", "_GNU_SOURCE=1")
--
--    -- set warning all as error
--    set_warnings("all", "error")
--
--    -- add include search directories
--    add_includedirs("/usr/include", "/usr/local/include")
--
--    -- add link libraries and search directories
--    add_links("tbox")
--    add_linkdirs("/usr/local/lib", "/usr/lib")
--
--    -- add system link libraries
--    add_syslinks("z", "pthread")
--
--    -- add compilation and link flags
--    add_cxflags("-stdnolib", "-fno-strict-aliasing")
--    add_ldflags("-L/usr/local/lib", "-lpthread", {force = true})
--
-- @endcode
--

