# Complete Ultrasaurus Blog File Structure

Create a new folder called `ultrasaurus-blog` and create these files with the exact content from the artifacts:

## Root Directory Files

```
ultrasaurus-blog/
├── _config.yml                 # Site configuration
├── Gemfile                     # Ruby dependencies  
├── index.html                  # Homepage
├── about.md                    # About page
├── ultrasaurus.md              # What is an ultrasaurus? page
├── setup.sh                    # Setup script (make executable)
└── README.md                   # Documentation
```

## Directory Structure

```
├── _layouts/
│   ├── default.html            # Base layout
│   ├── post.html              # Blog post layout
│   └── page.html              # Static page layout
├── _posts/
│   ├── 2009-04-12-language-is-a-reef-of-dead-metaphors.md
│   ├── 2016-06-15-sailsjs-testing-patterns-trunctate-database.md
│   ├── 2019-11-29-rust-2020-fulfill-the-promise.md
│   ├── 2019-12-01-brief-history-of-rtmp-future-thoughts.md
│   ├── 2019-12-16-memory-safety-necessary-not-sufficient.md
│   └── 2020-07-04-hope-is-not-a-strategy.md
├── assets/
│   └── main.scss              # Main stylesheet
└── .github/
    └── workflows/
        └── pages.yml          # GitHub Actions deployment
```

## Quick Setup Instructions

1. **Create the directory structure:**
   ```bash
   mkdir -p ultrasaurus-blog/{_layouts,_posts,assets,.github/workflows}
   cd ultrasaurus-blog
   ```

2. **Copy each artifact content** into the corresponding file shown above

3. **Make setup script executable and run it:**
   ```bash
   chmod +x setup.sh
   ./setup.sh
   ```

4. **Start local development:**
   ```bash
   bundle exec jekyll serve
   ```

5. **For GitHub deployment:**
   - Create new GitHub repository
   - Push all files to the repository
   - Enable GitHub Pages in repository settings
   - Select "GitHub Actions" as source

## Alternative: Quick Creation Script

Save this as `create-site.sh` and run it to auto-create the directory structure:

```bash
#!/bin/bash
mkdir -p ultrasaurus-blog/{_layouts,_posts,assets,.github/workflows}
cd ultrasaurus-blog
echo "📁 Created directory structure"
echo "Now copy the content from each artifact into the corresponding files"
echo "Files needed:"
echo "- _config.yml, Gemfile, index.html, about.md, ultrasaurus.md, README.md, setup.sh"
echo "- _layouts/default.html, post.html, page.html"  
echo "- _posts/*.md (6 blog post files)"
echo "- assets/main.scss"
echo "- .github/workflows/pages.yml"
```

## File Content Mapping

Each artifact corresponds to these files:

1. **Jekyll Site Configuration** → `_config.yml`
2. **Gemfile** → `Gemfile`
3. **Homepage** → `index.html`
4. **About Page** → `about.md`
5. **Ultrasaurus Page** → `ultrasaurus.md`
6. **Default Layout** → `_layouts/default.html`
7. **Post Layout** → `_layouts/post.html`
8. **Page Layout** → `_layouts/page.html`
9. **Main CSS** → `assets/main.scss`
10. **GitHub Actions Workflow** → `.github/workflows/pages.yml`
11. **Setup Script** → `setup.sh`
12. **README** → `README.md`

### Blog Posts (in _posts/ directory):
- **Flash CVE Analysis** → `_posts/2019-12-16-memory-safety-necessary-not-sufficient.md`
- **Hope Strategy** → `_posts/2020-07-04-hope-is-not-a-strategy.md`
- **RTMP History** → `_posts/2019-12-01-brief-history-of-rtmp-future-thoughts.md`
- **Rust 2020** → `_posts/2019-11-29-rust-2020-fulfill-the-promise.md`
- **SailsJS Testing** → `_posts/2016-06-15-sailsjs-testing-patterns-trunctate-database.md`
- **Language Metaphors** → `_posts/2009-04-12-language-is-a-reef-of-dead-metaphors.md`

Once you have all files created, the setup script will handle installing dependencies and getting everything ready for local development or GitHub Pages deployment!