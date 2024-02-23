echo "Check flutter"
flutter doctor
echo "Build ios frameworks"
flutter build ios-framework
echo "Mixing debug build for simulator with release build"
rm -R build/ios/framework/Release/App.xcframework/ios-arm64_x86_64-simulator
cp build/ios/framework/Debug/App.xcframework/arm64_x86_64-simulator build/ios/framework/Release/App.xcframework/arm64_x86_64-simulator
echo "Build android aar"
flutter build aar
echo "Coping dependencies into build/android"
gradle copyDependencies