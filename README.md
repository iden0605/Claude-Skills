# claude-skills

A collection of reusable Claude Code custom slash commands (skills) that can be dropped into any project.

## Installing skills

From the root of any project, run:

### Install all skills

```bash
bash <(curl -s https://raw.githubusercontent.com/iden0605/claude-skills/main/install.sh)
```

### Install specific skills

Pass skill names as arguments (folder names, no extension):

```bash
bash <(curl -s https://raw.githubusercontent.com/iden0605/claude-skills/main/install.sh) grill-me excalidraw-diagram
```

### What gets installed

Each skill folder is copied in full (including `SKILL.md` and any supporting files) into `.claude/skills/` in your current working directory. Restart Claude Code or reload the project for new skills to appear.

```
your-project/
└── .claude/
    └── skills/
        ├── grill-me/
        │   └── SKILL.md
        ├── excalidraw-diagram/
        │   └── SKILL.md
        ├── skill-builder/
        │   ├── SKILL.md
        │   └── reference.md
        └── ...
```

## Available skills

| Skill | Command | Description |
|-------|---------|-------------|
| commit-and-push | `/commit-and-push` | Stage all changes, draft a commit message from the diff, confirm branch and message with the user, then push |
| excalidraw-diagram | `/excalidraw-diagram` | Generate a fully-editable Excalidraw diagram from any concept, with consistent layout, color zones, and correct JSON schema |
| frontend-design | `/frontend-design` | Create distinctive, production-grade frontend interfaces with high design quality; avoids generic AI aesthetics |
| grill-me | `/grill-me` | Interview the user relentlessly about a plan or design, resolving each branch of the decision tree until reaching shared understanding |
| improve-codebase-architecture | `/improve-codebase-architecture` | Explore a codebase for architectural friction, propose module-deepening refactors, and create GitHub issue RFCs |
| skill-builder | `/skill-builder` | Build new skills or audit existing ones following Claude Code best practices, with a guided discovery interview |
| ui-review | `/ui-review [scope]` | Analyze frontend UI/UX, discuss improvements with the user, then orchestrate parallel design subagents to apply cohesive changes across all components/pages |

## Adding a new skill

1. Create a folder named after your skill at the repo root, with a `SKILL.md` inside:

```
my-skill/
└── SKILL.md
```

Supporting files (reference docs, scripts, examples) can live alongside `SKILL.md` in the same folder. Reference them from `SKILL.md` so Claude knows they exist.

2. Write your skill prompt in `SKILL.md`. Claude Code will expose it as `/my-skill`.

3. Add a row to the table above.

### Skill file format

`SKILL.md` is plain Markdown with optional YAML frontmatter:

```markdown
---
name: my-skill
description: Use when someone asks to [...]. Triggers on [...].
---

Your skill instructions here.
```

See the [Claude Code docs](https://docs.anthropic.com/en/docs/claude-code/slash-commands) for advanced usage (`$ARGUMENTS`, `context: fork`, `allowed-tools`, hooks, etc.). The `skill-builder` skill in this repo also has a full reference guide.

## Repository structure

```
claude-skills/
├── commit-and-push/
│   └── SKILL.md
├── excalidraw-diagram/
│   └── SKILL.md
├── frontend-design/
│   └── SKILL.md
├── grill-me/
│   └── SKILL.md
├── improve-codebase-architecture/
│   ├── SKILL.md
│   └── REFERENCE.md
├── skill-builder/
│   ├── SKILL.md
│   └── reference.md
├── ui-review/
│   └── SKILL.md
├── install.sh       # Installer script
├── LICENSE          # MIT
└── README.md
```

## License

MIT — see [LICENSE](./LICENSE).
