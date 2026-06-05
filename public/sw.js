const CACHE_NAME = "labelu-site-v2"

const ASSETS = [
  "/pj-labelu/",
  "/pj-labelu/site.webmanifest"
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

  if (!url.pathname.startsWith("/pj-labelu/")) return
  if (url.pathname.startsWith("/pj-labelu/admin/")) return

  event.respondWith(
    caches.match(event.request).then((cached) => {
      return cached || fetch(event.request)
    })
  )
})
