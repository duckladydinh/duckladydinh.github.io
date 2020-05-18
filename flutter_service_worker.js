'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "main.dart.js": "909a18c1853f10a53070c7f37c64c0a8",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"assets/LICENSE": "a9fe0fff5a4b74e545f8494a3b28b213",
"assets/AssetManifest.json": "424c8f952d4cfbc9775d77b8ecce7eee",
"assets/static/Lam_Gia_Thuan_CV_3_0.pdf": "a34a1a4a3545fe79439c0fb14cae9380",
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
