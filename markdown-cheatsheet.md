# Markdown Cheatsheet (Docs & Code Snippets)

Quick reference for writing documentation with code examples in Markdown (GitHub-flavored).

## Headings

```markdown
# H1
## H2
### H3
#### H4
```

## Text Styling

```markdown
*italic* or _italic_
**bold**
***bold italic***
~~strikethrough~~
`inline code`
```

## Inline Code

Use single backticks for short code references, commands, filenames, or variable names:

```markdown
Run `npm install` to install dependencies.
Set the `DEBUG` environment variable to `true`.
Edit `src/index.js`.
```

## Fenced Code Blocks

Use triple backticks with a language tag for syntax highlighting:

````markdown
```js
function greet(name) {
  return `Hello, ${name}!`;
}
```
````

Common language tags: `js` / `javascript`, `ts` / `typescript`, `py` / `python`, `bash` / `sh`, `json`, `yaml`, `html`, `css`, `sql`, `go`, `rust`, `java`, `c`, `cpp`, `diff`, `md`.

### Showing a diff

````markdown
```diff
- const x = 1;
+ const x = 2;
```
````

### Nesting a fenced block inside another (e.g. showing Markdown itself)

Use more backticks on the outer fence than the inner one:

`````markdown
````markdown
```js
console.log("hi");
```
````
`````

### No-highlight / plain text

````markdown
```text
Plain output, logs, or terminal results go here.
```
````

## Indented Code Block (alternative)

Indent by 4 spaces (no language highlighting, rarely preferred over fences):

```markdown
    const x = 1;
```

## Line Breaks Inside Code

Code blocks preserve whitespace and line breaks exactly as written — no need for trailing spaces or `<br>`.

## Links & Images

```markdown
[Link text](https://example.com)
![Alt text](image.png)
[Reference link][ref]

[ref]: https://example.com
```

## Lists

```markdown
- Item
- Item
  - Nested item

1. First
2. Second
   1. Nested

- [x] Done task
- [ ] Todo task
```

## Blockquotes

```markdown
> Note: this is a callout or aside.
> Multi-line quotes continue with `>`.
```

## Tables

```markdown
| Command      | Description         |
|--------------|----------------------|
| `ls`         | List files           |
| `cd <dir>`   | Change directory     |
```

Alignment:

```markdown
| Left | Center | Right |
|:-----|:------:|------:|
| a    |   b    |     c |
```

## Horizontal Rule

```markdown
---
```

## Footnotes

```markdown
Here's a claim.[^1]

[^1]: Supporting detail or source.
```

## Collapsible Sections (GitHub-flavored HTML)

```markdown
<details>
<summary>Click to expand</summary>

```bash
echo "hidden content, e.g. long logs or output"
```

</details>
```

## Admonition-style Callouts (GitHub)

```markdown
> [!NOTE]
> Useful information.

> [!TIP]
> A helpful suggestion.

> [!WARNING]
> Something to watch out for.

> [!IMPORTANT]
> Critical information.

> [!CAUTION]
> Risk of negative consequences.
```

## Escaping Characters

```markdown
\*not italic\*
\`not code\`
```

## Anchors / TOC Links

Headings auto-generate anchors (lowercased, spaces → hyphens):

```markdown
[Jump to Installation](#installation)
```

## Common Doc Patterns

**Command + expected output:**

````markdown
```bash
$ node --version
v20.11.0
```
````

**File tree:**

````markdown
```text
project/
├── src/
│   ├── index.js
│   └── utils.js
├── package.json
└── README.md
```
````

**Before/After comparison:**

```markdown
**Before**
```js
var x = 1;
```

**After**
```js
const x = 1;
```
```
</content>
