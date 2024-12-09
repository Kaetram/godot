cd platform/android/java

./gradlew clean

cd ../../..

# Compile the Android build templates.
scons platform=android arch=arm32 target=template_debug build_profile="kaetram.profile"
scons platform=android arch=arm64 target=template_debug build_profile="kaetram.profile"
scons platform=android arch=x86_32 target=template_debug
scons platform=android arch=x86_64 target=template_debug

scons platform=android arch=arm32 target=template_release build_profile="kaetram.profile"
scons platform=android arch=arm64 target=template_release build_profile="kaetram.profile"
scons platform=android arch=x86_32 target=template_release
scons platform=android arch=x86_64 target=template_release

# Compile via Gradle.
cd platform/android/java

./gradlew generateGodotTemplates