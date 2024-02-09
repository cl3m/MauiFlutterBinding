# Builds a xc library for a given xcode project (framework)
echo "Define parameters"
IOS_SDK_VERSION="17.2" # xcodebuild -showsdks
MAUI_BINDING_NAME="iOS.Binding"
SWIFT_PROJECT_NAME="Binding"
SWIFT_PROJECT_PATH="$SWIFT_PROJECT_NAME.xcodeproj"
SWIFT_BUILD_PATH="build"

echo "Build iOS framework for simulator and device"
rm -Rf "$SWIFT_BUILD_PATH"
rm -Rf "$SWIFT_PROJECT_NAME.xcframework"
rm -Rf "../iOS.Binding/$SWIFT_PROJECT_NAME.xcframework"
xcodebuild -sdk iphonesimulator$IOS_SDK_VERSION -project "$SWIFT_PROJECT_PATH" -configuration Release
xcodebuild -sdk iphoneos$IOS_SDK_VERSION -project "$SWIFT_PROJECT_PATH" -configuration Release

xcodebuild -create-xcframework -framework "$SWIFT_BUILD_PATH/Release-iphoneos/$SWIFT_PROJECT_NAME.framework/" -framework "$SWIFT_BUILD_PATH/Release-iphonesimulator/$SWIFT_PROJECT_NAME.framework/" -output "$SWIFT_PROJECT_NAME.xcframework"

echo "Generating binding api definition and structs"
mkdir "$SWIFT_PROJECT_NAME.xcframework/ios-arm64/$SWIFT_PROJECT_NAME.framework/Headers/$SWIFT_PROJECT_NAME"
cp "$SWIFT_PROJECT_NAME.xcframework/ios-arm64/$SWIFT_PROJECT_NAME.framework/Headers/$SWIFT_PROJECT_NAME.h" "$SWIFT_PROJECT_NAME.xcframework/ios-arm64/$SWIFT_PROJECT_NAME.framework/Headers/$SWIFT_PROJECT_NAME/$SWIFT_PROJECT_NAME.h"
sharpie bind --sdk=iphoneos$IOS_SDK_VERSION --namespace="$MAUI_BINDING_NAME" --scope="$SWIFT_PROJECT_NAME.xcframework/ios-arm64/$SWIFT_PROJECT_NAME.framework/Headers/" "$SWIFT_PROJECT_NAME.xcframework/ios-arm64/$SWIFT_PROJECT_NAME.framework/Headers/$SWIFT_PROJECT_NAME-Swift.h"

echo "Cleanup, Move xcframework and ApiDefinitions..."
rm -Rf "$SWIFT_BUILD_PATH"
cp -R "$SWIFT_PROJECT_NAME.xcframework" "../$MAUI_BINDING_NAME/"
rm -Rf "$SWIFT_PROJECT_NAME.xcframework"
mv "ApiDefinitions.cs" "../$MAUI_BINDING_NAME/"