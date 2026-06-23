# Design System Strategy: Eco-Editorial

## 1. Overview & Creative North Star
The Creative North Star for this design system is **"The Digital Larder."** 

We are moving away from the "utility-first" look of standard tracking apps toward a high-end, editorial experience that feels like a premium lifestyle magazine. The goal is to transform the mundane chore of inventory management into a moment of calm, organic interaction. 

To break the "template" feel, this system prioritizes **intentional asymmetry** and **tonal depth**. We reject the rigid, boxy grid in favor of breathing room and "floating" content. By leveraging a radical typography scale—where massive display type sits alongside delicate labels—we create a sense of hierarchy that feels curated and authoritative, not just functional.

---

## 2. Colors: Tonal Ecology
The palette is rooted in the "Eco-Minimalist" aesthetic, utilizing Sage and Earthy Grey to ground the Soft Cream background.

### The "No-Line" Rule
**Explicit Instruction:** Designers are prohibited from using 1px solid borders to section off content. Boundaries must be defined solely through background color shifts or subtle tonal transitions. 
*   *Implementation:* Use `surface-container-low` for secondary sections sitting on a `surface` background. The lack of lines creates a fluid, "airier" interface.

### Surface Hierarchy & Nesting
Treat the UI as a series of physical layers, like stacked sheets of fine, heavy-stock paper.
*   **Base:** `surface` (#fefae7)
*   **Low Priority/Large Areas:** `surface-container-low` (#f8f4e1)
*   **Interactive Cards:** `surface-container` (#f2eedb)
*   **Prominent Floating Elements:** `surface-container-highest` (#e7e3d0)

### The "Glass & Signature" Rule
To add visual "soul," use **Glassmorphism** for navigation bars and floating action buttons. Apply `surface-container-lowest` with a 70% opacity and a 12px backdrop-blur. 
*   **Signature Textures:** For high-impact CTAs (e.g., "Add Item"), use a subtle linear gradient transitioning from `primary` (#49672f) to `primary-container` (#81a263) at a 135-degree angle. This provides a professional polish that flat color cannot achieve.

---

## 3. Typography: Editorial Rhythm
We pair **Plus Jakarta Sans** (Display/Headlines) with **Be Vietnam Pro** (Body/Titles) to achieve a sophisticated, geometric-yet-warm character.

| Level | Token | Font | Size | Weight | Intent |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **Display** | `display-lg` | Plus Jakarta | 3.5rem | 700 | Large, asymmetrical hero stats (e.g., "80%") |
| **Headline**| `headline-md`| Plus Jakarta | 1.75rem | 600 | Category headers (e.g., "Vegetables") |
| **Title**   | `title-md`   | Be Vietnam   | 1.125rem | 500 | Item names in cards |
| **Body**    | `body-md`    | Be Vietnam   | 0.875rem | 400 | Descriptions and quantities |
| **Label**   | `label-md`   | Plus Jakarta | 0.75rem | 600 | Expiry badges and micro-copy |

---

## 4. Elevation & Depth: Tonal Stacking
We reject traditional drop shadows in favor of **Tonal Layering**.

*   **The Layering Principle:** Depth is achieved by placing a lighter surface on a darker one (or vice versa). Example: Place a `surface-container-lowest` card on a `surface-container` background to create a soft, natural lift.
*   **Ambient Shadows:** If an element must float (e.g., a Modal), use a shadow color tinted with the `on-surface` color (#1d1c11) at 5% opacity, with a 32px blur and 8px Y-offset. Never use pure black or grey shadows.
*   **The "Ghost Border" Fallback:** If accessibility requires a border, use the `outline-variant` (#c4c8ba) at **15% opacity**. This creates a suggestion of a boundary without breaking the organic flow.

---

## 5. Components: Organic Primitives

### Cards & Lists
*   **The 24dp Standard:** All primary cards must use `md` (1.5rem / 24dp) corner radius.
*   **Zero-Divider Policy:** Forbid the use of divider lines in lists. Separate items using 8px or 12px of vertical white space and subtle background shifts (`surface-container-low`).
*   **Expiry Badges:** Use high-contrast tonal chips.
    *   *Safe:* `primary-container` background with `on-primary-container` text.
    *   *Warning:* `tertiary-container` (#e27a77) background with `on-tertiary-container` (#5e1518) text.
    *   *Expired:* `error` background (#ba1a1a) with `on-error` text.

### Buttons
*   **Primary:** Gradient fill (`primary` to `primary-container`), `full` rounded corners, `title-sm` typography.
*   **Secondary:** Ghost style using `surface-container-highest` background, no border.

### Smart Inputs
*   **Style:** Minimalist underline or "Soft Box." Use `surface-container-highest` with a 4px bottom-radius only.
*   **State:** On focus, the `primary` sage green should "grow" as a 2px underline transition.

### Contextual Components
*   **Freshness Progress Rings:** Use a non-standard, thick-stroke (8dp) circular progress indicator using the `primary` color for fresh items, transitioning to `tertiary` as they age.
*   **Recipe Suggestion Sheets:** Use "Glassmorphism" layers to overlay recipe ideas atop the inventory list.

---

## 6. Do's and Don'ts

### Do
*   **Do** use asymmetrical margins. If the left margin is 24dp, try a 32dp right margin for hero sections to create an editorial feel.
*   **Do** use oversized imagery. Let high-quality photos of produce "break" the card boundaries (overflow).
*   **Do** prioritize `surface-container` shifts over lines for all grouping.

### Don't
*   **Don't** use 100% opaque black for text. Use `on-surface-variant` (#44483d) for secondary text to maintain the earthy tone.
*   **Don't** use standard Material 3 "Elevation" shadows. Stick to tonal stacking.
*   **Don't** use sharp corners. Every corner must be at least `sm` (0.5rem) to maintain the "Organic" brand promise.