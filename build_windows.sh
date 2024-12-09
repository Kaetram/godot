# Build the editor.
scons platform=windows

# Build the export templates for Windows.
scons platform=windows target=template_debug arch=x86_32 tools=no build_profile="kaetram.profile"
scons platform=windows target=template_release arch=x86_32 tools=no build_profile="kaetram.profile"
scons platform=windows target=template_debug arch=x86_64 tools=no build_profile="kaetram.profile"
scons platform=windows target=template_release arch=x86_64 tools=no build_profile="kaetram.profile"

# Rename the templates and place them in the correct directory.
cp bin/godot.windows.template_debug.x86_32.console.exe bin/windows_debug_x86_32_console.exe
cp bin/godot.windows.template_debug.x86_32.exe bin/windows_debug_x86_32.exe
cp bin/godot.windows.template_release.x86_32.console.exe bin/windows_release_x86_32_console.exe
cp bin/godot.windows.template_release.x86_32.exe bin/windows_release_x86_32.exe

cp bin/godot.windows.template_debug.x86_64.console.exe bin/windows_debug_x86_64_console.exe
cp bin/godot.windows.template_debug.x86_64.exe bin/windows_debug_x86_64.exe
cp bin/godot.windows.template_release.x86_64.console.exe bin/windows_release_x86_64_console.exe
cp bin/godot.windows.template_release.x86_64.exe bin/windows_release_x86_64.exe

# Copy the Windows templates to the templates_windows directory.
mkdir -p bin/templates_windows

mv bin/windows_debug_x86_32_console.exe bin/templates_windows/windows_debug_x86_32_console.exe
mv bin/windows_debug_x86_32.exe bin/templates_windows/windows_debug_x86_32.exe
mv bin/windows_release_x86_32_console.exe bin/templates_windows/windows_release_x86_32_console.exe
mv bin/windows_release_x86_32.exe bin/templates_windows/windows_release_x86_32.exe

mv bin/windows_debug_x86_64_console.exe bin/templates_windows/windows_debug_x86_64_console.exe
mv bin/windows_debug_x86_64.exe bin/templates_windows/windows_debug_x86_64.exe
mv bin/windows_release_x86_64_console.exe bin/templates_windows/windows_release_x86_64_console.exe
mv bin/windows_release_x86_64.exe bin/templates_windows/windows_release_x86_64.exe

cd platform/android/java

./gradlew clean

cd ../../..

# Compile the Android build templates.
scons platform=android arch=arm32 target=template_debug build_profile="kaetram.profile"
scons platform=android arch=arm64 target=template_debug build_profile="kaetram.profile"
scons platform=android arch=x86_32 target=template_debug build_profile="kaetram.profile"
scons platform=android arch=x86_64 target=template_debug build_profile="kaetram.profile"

scons platform=android arch=arm32 target=template_release build_profile="kaetram.profile"
scons platform=android arch=arm64 target=template_release build_profile="kaetram.profile"
scons platform=android arch=x86_32 target=template_release build_profile="kaetram.profile"
scons platform=android arch=x86_64 target=template_release build_profile="kaetram.profile"

# Compile via Gradle.
cd platform/android/java

./gradlew generateGodotTemplates