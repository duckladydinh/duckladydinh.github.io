'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "main.dart.js": "f4a7190d7a0b450b71e7ac6bfdc31b7e",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"assets/LICENSE": "97e5b7c95304b283a477b87ca2373966",
"assets/AssetManifest.json": "884fad55829170796f7c43a61ac09be4",
"assets/static/Lam_Gia_Thuan_CV_4_0.pdf": "1a729bb4898ba663bb02f9675eb24946",
"assets/FontManifest.json": "580ff1a5d08679ded8fcf5c6848cece7",
"index.html": "8b483ba217ee49b79f3834bc3b2739d6",
"/": "8b483ba217ee49b79f3834bc3b2739d6",
"manifest.json": "1cac2a606521f8398d4b6f0d6028d010",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1"
};

self.addEventListener('activate', function (event) {
  event.waitUntil(
    caches.keys().then(function (cacheName) {
      return caches.delete(cacheName);
    }).then(function (_) {
      return caches.open(CACHE_NAME);
    }).then(function (cache) {
      return cache.addAll(Object.keys(RESOURCES));
    })
  );
});

self.addEventListener('fetch', function (event) {
  event.respondWith(
    caches.match(event.request)
      .then(function (response) {
        if (response) {
          return response;
        }
        return fetch(event.request);
      })
  );
});
