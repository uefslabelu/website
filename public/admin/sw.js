const CACHE_NAME = "labelu-admin-v1"

const ASSETS = [
  "/pj-labelu/admin/",
  "/pj-labelu/admin/index.html",
  "/pj-labelu/admin/manifest.webmanifest"
]

self.addEventListener("install", (event) => {
  event.waitUntil(
    caches.open(CACHE_NAME).then((cache) => cache.addAll(ASSETS))
  )
})

self.addEventListener("activate", (event) => {
  event.waitUntil(self.clients.claim())
})

self.addEventListener("fetch", (event) => {
  const url = new URL(event.request.url)

  if (!url.pathname.startsWith("/pj-labelu/admin/")) return

  event.respondWith(
    caches.match(event.request).then((cached) => {
      return cached || fetch(event.request)
    })
  )
})