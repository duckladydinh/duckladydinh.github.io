# build
echo Building Flutter Project
flutter clean
flutter build web --release
echo Finish Building Flutter Project

# deploy to public
echo Deploying Webpage
rm -rf public
cp -r build/web public
echo Finish Deploying Webpage
