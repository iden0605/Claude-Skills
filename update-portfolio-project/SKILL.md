---
name: update-portfolio-project
description: Use when someone wants to add a project to their portfolio, generate a portfolio entry for the current project, document a project for the portfolio website, or update the portfolio with a new project.
argument-hint: [optional path to portfolio repo]
---

## What This Skill Does

Run this from inside any project repo. It reads the project, interviews you for data it can't infer, designs the detail page sections, then writes all changes directly to your portfolio repository — `projectData.js`, the detail component, and `App.jsx` — in one go.

Portfolio repo path: `/Users/iden/Documents/Projects/Personal/Portfolio` (default — confirm or override in Step 1).

---

## Step 1: Confirm Portfolio Path

If a path was passed as an argument (`$1`), use that. Otherwise use the default above.

Confirm with the user:
> "I'll write changes to `{portfolio-path}`. Is that the right path?"

Also verify these files exist before proceeding:
- `{portfolio-path}/src/Data/projectData.js`
- `{portfolio-path}/src/App.jsx`
- `{portfolio-path}/src/Components/Projects/`

---

## Step 2: Explore the Current Project

Read the project to understand it. Specifically:
- `README.md` (if present)
- `package.json` or equivalent dependency file — extract technologies
- Key source files: entry points, main components, core systems
- Git remote URL — run `git remote get-url origin` to get the GitHub link
- Any build/deploy config that reveals a live URL

From this, draft:
- A `description` paragraph (confirm with user later)
- A `technologies` array
- `githubLink`
- A proposed `tokenizedName` (lowercase, hyphens, no spaces — e.g. `"my-project"`)

---

## Step 3: Interview the User

Ask **one round at a time**. Wait for each answer before continuing.

**Round 1 — Identity & Type**
> "What's the **display name** for this project? (e.g. `'EchoAI'`, `'Afloat'`)
> And what **type** is it? Options: `Game Jam`, `Hackathon`, `University Project`, `Personal Project`, `Freelance`, or custom."

**Round 2 — Event & Award**
> "What **event or date** should appear on the card?
> Examples: `'MelbourneHack 2025 Winner'`, `'Click & Claw 2026 Finalist'`, `'June 2025 - July 2025'`
>
> Did you receive an **award**? `Winner`, `Finalist`, or none."

**Round 3 — Team & Role**
> "What was the **team size** (including yourself)?
> What was **your role**? Be specific — e.g. `'Game Programmer | Animator | Artist'` or `'Fullstack Developer'`."

**Round 4 — Links**
> "Do you have any of these links?
> - YouTube / demo video (`liveLink`)
> - GitHub repository — I detected `{detected URL}`, is that right?
> - Itch.io page (`itchLink`)
> - Live website (`wwwLink`)
>
> Leave blank for anything you don't have."

**Round 5 — Status & Duration**
> "Project **status**: `Released` or `Completed`?
> And roughly how long did you work on it? (e.g. `'4 Days'`, `'2 weeks'`, `'3 Months'`)"

**Round 6 — Key Responsibilities**
> "List your **key responsibilities** — what did you personally build or implement? Be specific: name the systems, components, features, or techniques you were responsible for.
>
> Write them as a bullet list. I'll format them into the right style."

After they answer, rewrite each bullet following the **Writing Style Guide** below, then confirm:
> "Here are your responsibilities formatted in portfolio style — any changes?"

**Round 7 — Description**
Show the draft description from Step 2:
> "Here's a draft description based on reading the codebase — edit freely:
>
> `{your draft}`"

Revise until confirmed.

---

## Writing Style Guide

Use this when drafting `description` and all `details[].content[].text` values.

**Description:**
- 2–4 sentences. Lead with what the project **is**, not how it was built.
- Name the core concept and key differentiating feature. Mention award in the first sentence if applicable.
- No filler: avoid "This project aims to..." or "This is a...".
- Pattern: `"{Name} is a {what it is} that {what it does}. {Key feature}. {Award or context}."`

**Key Responsibilities:**
- Start with a past-tense action verb: Designed, Implemented, Built, Developed, Created, Configured, Authored, Optimised.
- Name the specific system, component, class, or technique. One clear responsibility per bullet.
- Good: `"Implemented unique attack behaviours and procedural VFX for 10+ troops using Unity's Particle System and runtime LineRenderers."`
- Avoid: `"Worked on game stuff and helped with the UI."`

**Detail text blocks:**
- Present tense — describe *how it works*, not how you built it.
- Name classes, components, APIs, and algorithms. Use em dashes ( — ) for technical asides.
- Describe causality: what triggers what, what validates what, what notifies what.
- Example: `"The enemy path is defined by a series of waypoints. Each enemy's EnemyMovement component follows the chain while TroopBehavior uses waypoint index as a targeting priority key — always directing fire at the enemy closest to the exit."`

**Section titles:** Short and specific (2–5 words). Not "How it works" — use `"Wave System & Map Architecture"` or `"Right Split Screen Logic"`.

---

## Step 4: Design the `details` Sections

**First, ask the user what they want to showcase:**

> "What parts of this project do you most want to highlight on the page? For example:
> - A specific feature, mechanic, or system you're proud of
> - Something visually impressive you can screenshot or record
> - A technical decision or architecture worth explaining
> - Any content you already have assets for (screenshots, GIFs, recordings)
>
> You can be as vague or specific as you like — I'll use this to shape the page."

Wait for their answer. Use it as the primary input for what sections to include. Do not skip this — even a brief answer ("show the combat system and the UI") directly shapes which sections get priority and what screenshots/recordings to suggest.

**Then propose sections**, combining what the user said with what you found in the codebase:
- Lead with what the user explicitly wants to showcase
- Fill remaining sections with the most technically interesting or visually impressive things from the code
- Consider: What can be shown visually — screenshots, GIFs, video recordings? What warrants a written explanation of *how* it works?

**By project type (use as a secondary guide, user input takes priority):**
- **Games:** gameplay mechanics, unique systems, VFX, AI behaviour, architecture
- **Web apps:** UI flow, architecture decisions, AI/API integrations, data pipelines
- **Data/ML:** visualisations, model comparisons, data pipeline, results

Present proposed sections clearly:

> "Based on what you want to highlight and what I found in the codebase, here are the **detail sections** I'd suggest:
>
> **Section 1: [Title]** ← [note if this comes from user's input]
> - `image` — [what to screenshot, e.g. 'full gameplay screenshot showing the map and troop UI']
> - `text` — [draft paragraph in portfolio style]
>
> **Section 2: [Title]**
> - `video` — [what to screen-record, e.g. '30-second recording of the evolution animation']
> - `text` — [draft paragraph]
>
> For projects with multiple similar items (characters, cards, UI screens), suggest a `troop-carousel` block and describe what each item needs: a sprite PNG and an animation GIF.
>
> Does this structure work? Add, remove, or modify freely."

Each section becomes a **tab** in the terminal-style detail page. Tabs display as filenames (e.g. `introduction-cutscene.txt`, `spell-composition-system.txt`). Keep tab names short and descriptive.

If the project is simple with nothing visually interesting to show (e.g. a small script or data analysis), suggest skipping the `details` array entirely — a simple header-only page is fine.

---

## Step 5: Output the Asset Checklist

After the sections are confirmed, generate and display the full asset manifest the user needs to capture. Do not ask — tell them exactly what to capture and where to save it.

Use this format, grouped by section. Only include groups that apply to the confirmed sections:

```
Here's every file you need to capture, organised by section:

---
Card assets (root-level)
public/{tokenizedname}-hover.mp4
public/assets/project/{ProjectName}/{tokenizedname}-image-1.png

---
Section 1 — {Section 1 Title}
public/assets/project/{ProjectName}/{tokenizedname}-1.gif   ← or .png / .mp4 depending on type

---
Section 2 — {Section 2 Title}
public/assets/project/{ProjectName}/{tokenizedname}-2.gif

--- (repeat for each numbered section)

---
Section N — {Carousel Section Title}  (one entry per item you showcase)
public/assets/project/{ProjectName}/{Category}/pngs/{item-name}.png   ← sprite / icon
public/assets/project/{ProjectName}/{Category}/gifs/{item-name}.gif   ← behaviour GIF
e.g. {example-item-1}.png, {example-item-1}.gif, {example-item-2}.png, {example-item-2}.gif, etc.

---
Once you have all of these, ping me and I'll write all the portfolio files in one go.
```

**Rules:**
- Numbered section GIFs (`-1.gif`, `-2.gif`, etc.) increment across all non-carousel sections in order.
- For carousel sections, show the `{Category}/pngs/` and `{Category}/gifs/` (or `mp4s/`) pattern with concrete example names.
- For `image` type sections use `.png`, for `video` type use `.mp4`, for `gif` type use `.gif`.
- The hover preview video always lives at `public/{tokenizedname}-hover.mp4` (root of `public/`, no subfolder).
- The card thumbnail always lives at `public/assets/project/{ProjectName}/{tokenizedname}-image-1.png`.

Wait for the user to confirm they have the assets before proceeding to Step 6.

---

## Step 6: Build the Full JSON

Assemble the complete entry that will be inserted into `projectData.js`:

```js
"Project Name": {
  tokenizedName: "...",
  description: `...`,
  date: "...",
  type: "...",
  award: "...",          // omit key entirely if no award
  teamSize: N,
  role: "...",
  thumbnail: "/assets/project/{ProjectName}/...",
  previewVid: "/{tokenizedname}-hover.mp4",
  images: [],
  technologies: ["...", "..."],
  liveLink: "...",
  githubLink: "...",
  itchLink: "...",
  wwwLink: "...",
  status: "...",
  projectTime: "...",
  keyResponsibilities: [
    "...",
  ],
  details: [             // omit entirely if simple page
    {
      title: "...",
      content: [
        { type: "image", src: "...", width: "900px" },
        { type: "text", text: "..." },
      ]
    }
  ]
}
```

Show the full JSON to the user and confirm before writing anything.

---

## Step 7: Build the Detail Component

### Portfolio Design System — Catppuccin Macchiato Terminal Theme

The portfolio uses a dark Catppuccin Macchiato terminal aesthetic. All project detail pages follow a consistent pattern using two reusable components:

- **`ProjectHeader`** — renders a terminal with tabs for `overview.md` and `responsibilities.txt`. Titlebar shows `~/projects/{slug} $ ls`. Contains: YouTube embed (if applicable), project title, type badge, external links (GitHub/Itch.io/Website), description, and metadata (status, project_time, technologies). All driven from `projectData.js`.

- **`ProjectDetailTabSection`** — renders a second terminal below ProjectHeader with tabs for each entry in the `details` array. Titlebar shows `~/projects/{slug} $ ls`. Each tab displays its content blocks (images, text, videos, troop-carousels). Handles: CRT glitch animation on tab switch, height transitions, scroll arrows for overflow tabs, clickable images with ImageModal, and typing animation on the command prompt.

**Terminal styling features (handled automatically by these components):**
- Titlebar: dark mantle background (`#1e2030`), path text left-aligned in `#cad3f5`
- Tab bar: blue tab text (`#8aadf4`), active tab has white text + blue underline
- Prompt: green `❯` arrow + green command text with typing animation and blinking `▌` cursor
- CRT glitch animation on tab switch
- Smooth height transition via ResizeObserver

**Key colours (Catppuccin Macchiato):**
- Base: `#24273a` (terminal screen background)
- Mantle: `#1e2030` (titlebar, tab bar background)
- Green: `#a6da95` (commands, prompts, directory names)
- Blue: `#8aadf4` (links, tabs, hostnames, skills)
- Pink/Red: `#ed8796` (roles, job titles, meta keys, highlights)
- Text: `#eef0fc` (bright), `#cad3f5` (normal), `#a5adcb` (muted)

---

### Detail Component Pattern (all projects use this)

Every project detail page follows this exact pattern — simple or rich:

```jsx
import projectData from '../../Data/projectData';
import ProjectHeader from './ProjectHeader';
import ProjectDetailTabSection from './ProjectDetailTabSection';
import './ProjectDetails.css';

function {ProjectName}Detail() {
  const project = projectData["{Project Name}"];
  if (!project) return <div>Project not found.</div>;

  return (
    <main className="main-content">
      <div className="project-detail-container">
        <ProjectHeader projectName="{Project Name}" />
        {project.details && (
          <ProjectDetailTabSection details={project.details} projectName="{Project Name}" />
        )}
      </div>
    </main>
  );
}

export default {ProjectName}Detail;
```

**Rules:**
- The `projectName` prop must exactly match the key in `projectData.js`.
- `ProjectDetailTabSection` only renders if `details` exists — safe to always include the conditional.
- Do NOT write raw HTML sections, image blocks, or custom layouts. All content goes through `projectData.js` → `ProjectDetailTabSection`.
- Do NOT import `ImageModal`, `TroopCarousel`, or `useState` in the detail component — `ProjectDetailTabSection` handles all of that internally.
- Do NOT add new CSS classes. The existing `ProjectDetails.css` styles everything.
- Only import `TroopCarousel` if you're adding a new content type to `ProjectDetailTabSection` itself (you shouldn't need to).

### Content Types in `details`

Each entry in the `details` array becomes a tab. The `content` array supports these block types:

```js
{ type: "image", src: "/assets/project/...", width: "900px" }
// Clickable image that opens ImageModal. Centered on desktop, constrained to 100% on mobile.

{ type: "text", text: "Paragraph of descriptive text." }
// Rendered as a styled paragraph with left border accent.

{ type: "video", src: "/assets/project/...", width: "900px" }
// Auto-playing muted looping video.

{ type: "troop-carousel", items: [
  { name: "Item Name", sprite: "/path/sprite.png", gif: "/path/anim.mp4", attackName: "Attack", description: "..." },
  // ... more items
]}
// Interactive carousel with sprite selector, GIF/video panel, and description. Pre-renders all media to avoid flash on switch.
```

---

## Step 8: Write All Portfolio Changes

Now make all three changes to the portfolio repo:

**1. Add to `{portfolio-path}/src/Data/projectData.js`**
Insert the new entry inside the `projectData` object. Preserve all existing entries.

**2. Create `{portfolio-path}/src/Components/Projects/{ProjectName}Detail.jsx`**
Write the component from Step 7. It should be ~20 lines — no more.

**3. Update `{portfolio-path}/src/App.jsx`**
Add the import with other project detail imports:
```jsx
import {ProjectName}Detail from './Components/Projects/{ProjectName}Detail';
```
Add the route inside `<Routes>` with other project routes:
```jsx
<Route path="/projects/{tokenizedName}" element={<{ProjectName}Detail />} />
```

---

## Step 9: Confirm

```
Done. Added "{Project Name}" to the portfolio:

  src/Data/projectData.js              — project entry with {N} detail sections
  src/Components/Projects/{ProjectName}Detail.jsx  — detail component
  src/App.jsx                          — route /projects/{tokenizedName}

Assets still needed:
  public/{tokenizedname}-hover.mp4     — card hover preview
  public/assets/project/{ProjectName}/ — images, videos, sprites per checklist
```

---

## Data Validation Checklist

Before writing any files:
- [ ] `tokenizedName` is kebab-case, no spaces or special characters
- [ ] `date` format: `"MMM YYYY - MMM YYYY"` or event string like `"MelbourneHack 2025 Winner"`
- [ ] `technologies` is an **array of strings** (not comma-separated)
- [ ] `award` key is **omitted entirely** if no award — not `""` or `null`
- [ ] Empty links use `""` — the key is always present
- [ ] `previewVid` points to `/{tokenizedname}-hover.mp4` (root of `public/`, no subfolder)
- [ ] Required fields present: `tokenizedName`, `description`, `type`, `role`, `status`, `projectTime`
- [ ] Detail component uses the clean `ProjectHeader` + `ProjectDetailTabSection` pattern only — no raw HTML sections
- [ ] `projectName` prop exactly matches the `projectData.js` key string
