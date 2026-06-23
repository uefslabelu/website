# 🚩 Labelu

Labelu is an institutional website for the Laboratory of History and Memory of Class Struggle (Laboratório de História e Memória da Luta de Classes) at the State University of Feira de Santana (UEFS).
It is a Content Management System (CMS) that serves as a digital showcase and entry point for researchers and individuals interested in academic studies on class struggles and labor movements.

## ℹ️ Project Structure

Inside of your Astro project, you'll see the following folders and files:

```text
├── public/
├── src/
│   ├── assets/
│   ├── components/
│   ├── content/
│   ├── layouts/
│   └── pages/
├── astro.config.mjs
├── README.md
├── package.json
└── tsconfig.json
```

Astro looks for `.astro` or `.md` files in the `src/pages/` directory. Each page is exposed as a route based on its file name.

There's nothing special about `src/components/`, but that's where we like to put any Astro/React/Vue/Svelte/Preact components.

The `src/content/` directory contains "collections" of related Markdown and MDX documents. Use `getCollection()` to retrieve posts from `src/content/blog/`, and type-check your frontmatter using an optional schema. See [Astro's Content Collections docs](https://docs.astro.build/en/guides/content-collections/) to learn more.

Any static assets, like images, can be placed in the `public/` directory.

## 🧞 Commands

All commands are run from the root of the project, from a terminal:

| Command                   | Action                                           |
| :------------------------ | :----------------------------------------------- |
| `npm install`             | Installs dependencies                            |
| `npm run dev`             | Starts local dev server at `localhost:4321`      |
| `npm run build`           | Build your production site to `./dist/`          |
| `npm run preview`         | Preview your build locally, before deploying     |
| `npm run astro ...`       | Run CLI commands like `astro add`, `astro check` |
| `npm run astro -- --help` | Get help using the Astro CLI                     |

## 🔄 Syncing Customer Changes

Use [`sync-back.sh`](sync-back.sh) to bring changes from the customer fork back into this repository.

The script:

1. Adds the customer remote (`https://github.com/UEFSLabelu/website`) if it is not already configured.
2. Fetches the latest customer branch and this repository's `main` branch.
3. Creates or resets the `update-from-fork` branch from `origin/main`.
4. Merges the customer's `main` branch into `update-from-fork`.
5. Pushes `update-from-fork` to `origin`.
6. Opens the GitHub compare page so a pull request can be created.

Run it from the project root:

```sh
./sync-back.sh
```

If the merge has conflicts, the script stops and prints the commands to finish manually:

```sh
git add <files> && git commit
git push origin update-from-fork -f
```

After resolving conflicts and pushing the branch, open the compare URL printed by the script to create the pull request.

## 🚀 Deploy

Every update at `main` branch will trigger a deploy workflow setup for our Github Actions. The website is deployed under the Github Pages.

See `.github/workflows/astro.yml` for more information.

## 👀 Want to learn more?

Check out [Astro's documentation](https://docs.astro.build) or jump into their [Discord server](https://astro.build/chat).

## 👷 Developed by

This work was developed by [EcompJr](https://ecompjr.com.br/).

### Our Team

- **Executive Director of Projects**: [Barreto](https://github.com/rickbarretto)
- **Project Manager**: [Robson Carvalho](https://github.com/Robson-Carvalho)
- **Project Lead**: [Ítallo Guimarães](https://github.com/ItalloGuimaraes)
- **Frontend Developer**: [Guilherme Fernandes](https://github.com/DrizinCoder)
- **Frontend Developer**: [Lucas Guerra](https://github.com/lucasarguerra)

### Prototype

The initial theme used for prototype was provided by Astro's default theme.
This is based off of the lovely [Bear Blog](https://github.com/HermanMartinus/bearblog/).
