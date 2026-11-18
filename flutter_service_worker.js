'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"404.html": "d514f64d09ad1a03503dba1d7fb1e3ce",
"app.html": "2e30fa63b82b9e6e3e8377080d28f126",
"assets/AssetManifest.bin": "bfe19d5560c1024c8117759e8bb2b207",
"assets/AssetManifest.bin.json": "de92374e20a7d8993f1baff70a8e8c6b",
"assets/AssetManifest.json": "6efd835b9abf1582c05e8cb5ffc289c6",
"assets/assets/app_Icon.jpg": "f758f97932f63c96e5334285b5873207",
"assets/assets/empty_state.png": "15055e7a5afccdd5541fe739e69cbf78",
"assets/assets/images/accountactivation/QrCode.png": "2a64c2b1c02575cb373480bb4f35c690",
"assets/assets/images/accountactivation/Successmark.png": "a4be3ad506204d4d8d6c4df36f459258",
"assets/assets/images/accountactivation/Wallet.png": "e5f74aa5d5553e2ee2870ee17f42477c",
"assets/assets/images/auto_mechanic/auto-mechanic.png": "41e97e057c44b6de867d5e3c6652e3ba",
"assets/assets/images/Dashboard/Docs.png": "d5423872e5d95ff299c831808aed9b5b",
"assets/assets/images/Dashboard/Earning.png": "3b75722b3b3ad300b9fe972b526e99d7",
"assets/assets/images/Dashboard/Language.png": "07db38d9be24285fd5e852a8a79a50ca",
"assets/assets/images/Dashboard/Left.png": "fd2ea815b103319ebf3da713feef73b0",
"assets/assets/images/Dashboard/LocationImage.png": "123c5f5c9ef6a98cc4a8a5ee9fdefbc9",
"assets/assets/images/Dashboard/no_reviews.png": "d5423872e5d95ff299c831808aed9b5b",
"assets/assets/images/Dashboard/Password.png": "b67c0e7f561d3e1c6cff1dd6795b006a",
"assets/assets/images/Dashboard/Profile.png": "1f88f863579613f0b3a67c07fba81e65",
"assets/assets/images/Dashboard/Rectangle.png": "4c07b2bbc59977c097f307100edadc24",
"assets/assets/images/Dashboard/Right.png": "30e4ba09d161c1b138744ae9fe03ff45",
"assets/assets/images/Dashboard/Successmark.png": "3691b15cc5accdcf1ba0fee030127ecc",
"assets/assets/images/engineers/woman-engineers.png": "920e616db33cfae5993233e756c303f9",
"assets/assets/images/otp/otp_page.png": "d6486c40399e9104e51a12e8b62ed57a",
"assets/assets/images/painter/painter.png": "d703e12d685b01ec8dbe4cb9345697f9",
"assets/assets/images/plumber/plum.png": "86665add37e6747d4a6d40209f896e96",
"assets/assets/images/plumber/plumber.png": "8bbcea5a15ea4bee145fb39abd43e500",
"assets/assets/images/profile/AddImage.png": "0a40504313236fea04be0a6e536f2a12",
"assets/assets/images/profile/Cross.png": "080aae402bfe974e34c2428b68ec878e",
"assets/assets/images/profile/DropdownIcon.png": "c50af9dc1703bd053d7c4339614b66ca",
"assets/assets/images/profile/Successmark.png": "76ed512e3d16c8d9154433df7192c6eb",
"assets/assets/logo/extra/apple_logo.png": "f21c5233b11f131d1be16248cf577aae",
"assets/assets/logo/extra/ComingSoon.png": "9deca63f68bd9718ce8c7d50f6dc0598",
"assets/assets/logo/extra/Email.png": "46e1f580ab1cebda5fef7e345fe20ddc",
"assets/assets/logo/extra/google_logo.png": "1c59a33f1f7c636b6deed4dcdfeaa1d8",
"assets/assets/logo/extra/phone_logo.png": "8783130fdbea05c38d2819b617e2358a",
"assets/assets/logo/extra/verified.png": "6b21f41b96640ca45b88484126b35bd2",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "29158d3e822774dc8debb2ae7b5cc144",
"assets/NOTICES": "1a79af1a52eecc84a0651d1928dc71d1",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/packages/fluttertoast/assets/toastify.css": "a85675050054f179444bc5ad70ffc635",
"assets/packages/fluttertoast/assets/toastify.js": "56e2c9cedd97f10e7e5f1cebd85d53e3",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "738255d00768497e86aa4ca510cce1e1",
"canvaskit/canvaskit.js.symbols": "74a84c23f5ada42fe063514c587968c6",
"canvaskit/canvaskit.wasm": "9251bb81ae8464c4df3b072f84aa969b",
"canvaskit/chromium/canvaskit.js": "901bb9e28fac643b7da75ecfd3339f3f",
"canvaskit/chromium/canvaskit.js.symbols": "ee7e331f7f5bbf5ec937737542112372",
"canvaskit/chromium/canvaskit.wasm": "399e2344480862e2dfa26f12fa5891d7",
"canvaskit/skwasm.js": "5d4f9263ec93efeb022bb14a3881d240",
"canvaskit/skwasm.js.symbols": "c3c05bd50bdf59da8626bbe446ce65a3",
"canvaskit/skwasm.wasm": "4051bfc27ba29bf420d17aa0c3a98bce",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "383e55f7f3cce5be08fcf1f3881f585c",
"flutter_bootstrap.js": "83795fe2a8a25ccff05154181f6ec196",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "4708946e1a802f9e8df148b9b2459141",
"/": "4708946e1a802f9e8df148b9b2459141",
"main.dart.js": "158f82fa71a2f5786bcbdcedde427308",
"manifest.json": "d37bdb446385ec79ec33d06ca75cd3b0",
"showcase.html": "84a664a86e9651a84df33edf5b2f6edf",
"version.json": "b60c402fa101b0cc11cbbd53398c3547"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
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
        // Claim client to enable caching on first launch
        self.clients.claim();
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
      // Claim client to enable caching on first launch
      self.clients.claim();
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
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
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
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
