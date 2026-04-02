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

Based on what you found in the codebase, propose a `details` array. Think about:
- What are the most technically interesting or visually impressive systems?
- What can be shown visually — screenshots, GIFs, video recordings?
- What warrants a written explanation of *how* it works?

**By project type:**
- **Games:** gameplay mechanics, unique systems, VFX, AI behaviour, architecture
- **Web apps:** UI flow, architecture decisions, AI/API integrations, data pipelines
- **Data/ML:** visualisations, model comparisons, data pipeline, results

Present proposed sections clearly and ask for confirmation:

> "Here are the **detail sections** I'd suggest for the project page:
>
> **Section 1: [Title]**
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

If the project is simple with nothing visually interesting to show (e.g. a small script or data analysis), suggest skipping the `details` array entirely — a simple header-only page is fine.

---

## Step 5: Ask About Images & Media

Ask:
> "What **assets** will you capture for this project? I'll assign paths following the naming convention.
>
> Files go under `public/assets/project/{ProjectName}/` in the portfolio repo.
>
> For each section above, here's what to capture:
> - Section 1: [specific screenshot description] → save as `{tokenizedname}-image-1.png`
> - Section 2: [specific recording description] → save as `{tokenizedname}-video-1.mp4`
> - etc.
>
> Do you want to provide your own filenames, or use these placeholders?"

**Naming convention (apply to all unspecified files):**
- Thumbnail: `/assets/project/{ProjectName}/{tokenizedname}-image-1.png`
- Additional images: `{tokenizedname}-image-2.png`, `-3.png`, etc.
- Videos in sections: `{tokenizedname}-video-1.mp4`, etc.
- GIFs: `{tokenizedname}-1.gif`, etc.
- Carousel sprites: `/assets/project/{ProjectName}/{category}/pngs/{name}.png`
- Carousel GIFs: `/assets/project/{ProjectName}/{category}/gifs/{name}.gif`
- Preview video (card hover): `/{tokenizedname}-hover.mp4` — this lives at the **root** of `public/`, not in a subfolder

If the user provides filenames, use those exactly. Apply the convention only to unspecified files.

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

## Step 7: Determine Detail Page Type & Build the Component

**If NO `details` key → Simple detail page:**

Create `{portfolio-path}/src/Components/Projects/{ProjectName}Detail.jsx`:

```jsx
import React, { useState } from 'react';
import projectData from '../../Data/projectData';
import ProjectHeader from './ProjectHeader';
import './ProjectDetails.css';
import ImageModal from '../Global/ImageModal';

function {ProjectName}Detail() {
  const project = projectData["{ProjectName}"];

  if (!project) {
    return <div>Project not found.</div>;
  }

  const [modalOpen, setModalOpen] = useState(false);
  const [selectedImage, setSelectedImage] = useState('');

  const handleImageClick = (imageSrc) => {
    setSelectedImage(imageSrc);
    setModalOpen(true);
  };

  const closeModal = () => {
    setModalOpen(false);
    setSelectedImage('');
  };

  return (
    <main className="main-content">
      <div className="project-detail-container">
        <ProjectHeader projectName="{ProjectName}" />
      </div>

      {modalOpen && (
        <ImageModal
          src={selectedImage}
          alt={`Expanded image for {ProjectName}`}
          onClose={closeModal}
        />
      )}
    </main>
  );
}

export default {ProjectName}Detail;
```

**If YES `details` key → Rich detail page:**

Invoke the `/frontend-design` skill with this prompt:

> "Build a React detail page component for a portfolio project called '{ProjectName}'. Component path: `src/Components/Projects/{ProjectName}Detail.jsx`.
>
> **Requirements:**
> - Import `projectData` from `'../../Data/projectData'`, access as `projectData["{ProjectName}"]`
> - Import and render `<ProjectHeader projectName="{ProjectName}" />` at the top (from `'./ProjectHeader'`)
> - Import `'./ProjectDetails.css'` and `ImageModal` from `'../Global/ImageModal'`
> - Manage `modalOpen` and `selectedImage` state for clickable images
> - Iterate over `project.details` (`{ title, content[] }[]`) — wrap each in `<section className='section' data-aos='fade-up'>` with an `<h2>` heading
> - `renderContentBlock(item, index)` switch on `item.type`:
>   - `'image'` → `<img style={{ width: item.width }}>`, click opens ImageModal
>   - `'text'` → `<p>{item.text}</p>`
>   - `'video'` → `<video autoPlay loop muted playsInline style={{ width: item.width }}>`
>   - `'troop-carousel'` → `<TroopCarousel items={item.items} />` (import from `'./TroopCarousel'`)
> - Dark, minimal aesthetic matching the rest of the portfolio
>
> **Section layout notes:**
> {paste the section design from Step 4}
>
> **Full project JSON:**
> {paste full JSON}"

Write the returned component to `{portfolio-path}/src/Components/Projects/{ProjectName}Detail.jsx`.

---

## Step 8: Write All Portfolio Changes

Now make all three changes to the portfolio repo:

**1. Add to `{portfolio-path}/src/Data/projectData.js`**
Insert the new entry inside the `projectData` object. Preserve all existing entries.

**2. Create `{portfolio-path}/src/Components/Projects/{ProjectName}Detail.jsx`**
Write the component from Step 7.

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
✓ Added "{ProjectName}" to {portfolio-path}/src/Data/projectData.js
✓ Created {portfolio-path}/src/Components/Projects/{ProjectName}Detail.jsx
✓ Registered route /projects/{tokenizedName} in {portfolio-path}/src/App.jsx

Assets to add:
- public/assets/project/{ProjectName}/ — images and videos per the naming convention
- public/{tokenizedname}-hover.mp4 — card hover preview video
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
