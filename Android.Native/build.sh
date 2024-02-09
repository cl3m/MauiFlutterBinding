echo "Build library"
chmod +x ./gradlew
rm -Rf binding/xamarin
./gradlew xamarin
echo "Copy aar .."
cp binding/build/outputs/aar/binding-release.aar ../Android.Binding/jars/
rm ../Android.Binding/jars/.DS_Store
echo " ===================== Jars diff ====================="
# androidx is added via nuget
diff -rq binding/xamarin ../Android.Binding/jars | grep -vE 'org.jetbrains|com.google|: androidx|binding-release.aar'
echo "Copy the missing jars or install via nuget (if any)"
echo " ===================== Jars diff ====================="
rm -Rf build
rm -Rf binding/build
rm -Rf demoapp/build