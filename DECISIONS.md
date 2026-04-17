# Decisions

This document records project decisions so the team can remember why specific tools and approaches were chosen.

## April 2026

### April 15 (Wednesday)

I created this repository after reviewing the current state of Labelu. The project was originally promised for completion in 2021 but remains unfinished.

The codebase is split into two repositories: the front end ([pj-labelu-front](https://github.com/EcompJr/pj-labelu-front), React + Vite) and the backend ([Labelu](https://github.com/EcompJr/Labelu), PHP/Laravel). 
On inspection, many pages, integrations, and backend services are missing—my estimate is the project is under 60% complete. In places where features appear implemented, there is little testing or verification, which would require additional time to debug and validate.

**Choosing an approach**

We evaluated three options:

1. Continue with PHP and finish the existing backend.
2. Rewrite in our stack: FastAPI + React.
3. Use Astro with a Git-backed CMS.

I chose option 3. Astro is well suited for content-focused sites and allows rapid delivery. Pairing Astro with a Git-backed CMS removes the need to build a full backend solely to serve mostly static pages, reduces duplication, and lowers the risk of introducing bugs while finishing remaining content.

**Choosing a CMS**

I evaluated several CMS options and selected Decap (formerly Netlify CMS). It is simple to configure and its free tier meets the needs of this project.
