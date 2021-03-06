'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "main.dart.js": "24aeb087c8ea5f3e7c453ae60db3642f",
"favicon.png": "1ef5cb437ac460a2f7770590ec969a90",
"assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"assets/AssetManifest.json": "bce5b8e2c3609398c0460dff4801104b",
"assets/NOTICES": "f16a6845c8a6e37aa6ad34cd9180d243",
"assets/static/wallpapers/night_wallpaper.gif": "bc5b66b8253b9bd7fcf2f36e2c448f9d",
"assets/static/wallpapers/light_wallpaper.gif": "d01f42fd5f2d8e3c00ae642a728ae1d9",
"assets/static/Lam_Gia_Thuan_CV_4_0.pdf": "91a8ddba9cf30979cab51b7016ee0b2a",
"assets/static/icons/news_icon.png": "e304f815a4f2b465d4aed907bd8c92be",
"assets/static/icons/scholar_icon.png": "68f2b177acc9f707a0d97103036a3f78",
"assets/static/icons/scholar_icon.png~": "443e638c0cdfd87069dcb079676092c1",
"assets/static/icons/resume_icon.png": "526ac2fae374f2a2c368c09cf42a5c18",
"assets/static/icons/sun_icon.png": "72eee53ce8b893ef57a4ca34a8c1e5e8",
"assets/static/icons/moon_icon.png": "715f3af0fa7a3845b0195fbec95b4cc7",
"assets/static/icons/pika_icon.png": "803a1935651b46e721dc2590ab5de14a",
"assets/static/icons/github_icon.png": "c96d65bce0240f2a0f6b2b0de32b73c8",
"assets/FontManifest.json": "580ff1a5d08679ded8fcf5c6848cece7",
"index.html": "a3d77fc3aa213dc1c8f6ea0f4234a52c",
"/": "a3d77fc3aa213dc1c8f6ea0f4234a52c",
"manifest.json": "1cac2a606521f8398d4b6f0d6028d010",
"favicon.png~": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-512.png": "1ef5cb437ac460a2f7770590ec969a90",
"icons/Icon-192.png~": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png~": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-192.png": "1ef5cb437ac460a2f7770590ec969a90"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/LICENSE",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      // Provide a no-cache param to ensure the latest version is downloaded.
      return cache.addAll(CORE.map((value) => new Request(value, {'cache': 'no-cache'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');

      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }

      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#')) {
    key = '/';
  }
  // If the URL is not the the RESOURCE list, skip the cache.
  if (!RESOURCES[key]) {
    return event.respondWith(fetch(event.request));
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache. Ensure the resources are not cached
        // by the browser for longer than the service worker expects.
        var modifiedRequest = new Request(event.request, {'cache': 'no-cache'});
        return response || fetch(modifiedRequest).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.message == 'skipWaiting') {
    return self.skipWaiting();
  }

  if (event.message = 'downloadOffline') {
    downloadOffline();
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey in Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.add(resourceKey);
    }
  }
  return Cache.addAll(resources);
}
