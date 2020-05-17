'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "main.dart.js": "0cda01424136d8afc5704a938f0f25e0",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"assets/LICENSE": "6c13c7736744e04429b4dfbdc70212b5",
"assets/AssetManifest.json": "424c8f952d4cfbc9775d77b8ecce7eee",
"assets/static/Lam_Gia_Thuan_CV_3_0.pdf": "4a1b12c9b36a68b2948d069764d892d0",
"assets/FontManifest.json": "580ff1a5d08679ded8fcf5c6848cece7",
"index.html": "43a73ec9993b3eb663f45066b8cf987c",
"/": "43a73ec9993b3eb663f45066b8cf987c",
"manifest.json": "b82ae0fcb0043526c3b2b8bfb6b0c46f",
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
