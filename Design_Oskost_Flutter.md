---
name: Wabi-Sabi Sanctuary
colors:
  surface: '#fef8f5'
  surface-dim: '#ded9d6'
  surface-bright: '#fef8f5'
  surface-container-lowest: '#ffffff'
  surface-container-low: '#f8f2ef'
  surface-container: '#f2ede9'
  surface-container-high: '#ede7e4'
  surface-container-highest: '#e7e1de'
  on-surface: '#1d1b19'
  on-surface-variant: '#50453b'
  inverse-surface: '#32302e'
  inverse-on-surface: '#f5f0ec'
  outline: '#82756a'
  outline-variant: '#d4c3b7'
  surface-tint: '#7e562e'
  primary: '#714a23'
  on-primary: '#ffffff'
  primary-container: '#8c6239'
  on-primary-container: '#ffe8d7'
  inverse-primary: '#f1bc8c'
  secondary: '#58614f'
  on-secondary: '#ffffff'
  secondary-container: '#dce6cf'
  on-secondary-container: '#5e6755'
  tertiary: '#6f4b26'
  on-tertiary: '#ffffff'
  tertiary-container: '#8a633b'
  on-tertiary-container: '#ffe9d7'
  error: '#ba1a1a'
  on-error: '#ffffff'
  error-container: '#ffdad6'
  on-error-container: '#93000a'
  primary-fixed: '#ffdcbf'
  primary-fixed-dim: '#f1bc8c'
  on-primary-fixed: '#2d1600'
  on-primary-fixed-variant: '#633f19'
  secondary-fixed: '#dce6cf'
  secondary-fixed-dim: '#c0cab4'
  on-secondary-fixed: '#161e10'
  on-secondary-fixed-variant: '#414939'
  tertiary-fixed: '#ffdcbd'
  tertiary-fixed-dim: '#eebd8e'
  on-tertiary-fixed: '#2c1600'
  on-tertiary-fixed-variant: '#61401b'
  background: '#fef8f5'
  on-background: '#1d1b19'
  surface-variant: '#e7e1de'
typography:
  display-lg:
    fontFamily: Noto Serif
    fontSize: 36px
    fontWeight: '400'
    lineHeight: 44px
    letterSpacing: -0.02em
  headline-lg:
    fontFamily: Noto Serif
    fontSize: 28px
    fontWeight: '500'
    lineHeight: 36px
    letterSpacing: -0.015em
  headline-md:
    fontFamily: Noto Serif
    fontSize: 22px
    fontWeight: '500'
    lineHeight: 30px
    letterSpacing: -0.01em
  headline-sm:
    fontFamily: Noto Serif
    fontSize: 18px
    fontWeight: '600'
    lineHeight: 26px
    letterSpacing: '0'
  title-md:
    fontFamily: Plus Jakarta Sans
    fontSize: 16px
    fontWeight: '600'
    lineHeight: 24px
    letterSpacing: 0.01em
  body-lg:
    fontFamily: Plus Jakarta Sans
    fontSize: 16px
    fontWeight: '400'
    lineHeight: 26px
    letterSpacing: '0'
  body-md:
    fontFamily: Plus Jakarta Sans
    fontSize: 14px
    fontWeight: '400'
    lineHeight: 22px
    letterSpacing: 0.01em
  body-sm:
    fontFamily: Plus Jakarta Sans
    fontSize: 13px
    fontWeight: '400'
    lineHeight: 18px
    letterSpacing: 0.015em
  label-md:
    fontFamily: Plus Jakarta Sans
    fontSize: 12px
    fontWeight: '600'
    lineHeight: 16px
    letterSpacing: 0.06em
  label-sm:
    fontFamily: Plus Jakarta Sans
    fontSize: 11px
    fontWeight: '500'
    lineHeight: 14px
    letterSpacing: 0.08em
  currency-display:
    fontFamily: Plus Jakarta Sans
    fontSize: 24px
    fontWeight: '700'
    lineHeight: 32px
    letterSpacing: -0.02em
rounded:
  sm: 0.25rem
  DEFAULT: 0.5rem
  md: 0.75rem
  lg: 1rem
  xl: 1.5rem
  full: 9999px
spacing:
  space-xxs: 0.25rem
  space-xs: 0.5rem
  space-sm: 0.75rem
  space-md: 1rem
  space-lg: 1.25rem
  space-xl: 1.5rem
  space-2xl: 2rem
  space-3xl: 2.5rem
  screen-margin-mobile: 1.25rem
  card-gutter: 0.875rem
  bottom-nav-height: 4.25rem
---

## Brand & Style

This design system reimagines the boarding house tenant experience through the Japanese philosophy of *Wabi-Sabi* (侘寂)—an aesthetic that honors simplicity, warmth, natural asymmetry, and unpretentious craftsmanship. In stark contrast to high-stress, harsh neon financial utility tools, the boarding house is a tenant's sanctuary: a place of rest, return, and mindful domestic rhythm.

The design movement blends **Tactile Organic Warmth** with **Japanese Editorial Minimalism**. The emotional tone is grounded, calm, and dignified. It eliminates stark digital pure-black `#000000` and clinical pure-white `#FFFFFF` entirely, replacing them with sumi-ink washes, sun-bleached clay, unbleached washi paper, and aged linen textures.

Every touchpoint evokes quiet domesticity:
- **Atmospheric Warmth:** Surfaces mimic woven tatami, unglazed ceramic, and fibrous washi papers.
- **Intentional Restraint:** Visual noise is stripped down; notifications, billing notices, and maintenance requests appear as gentle prompts rather than alarming red alerts.
- **Organic Balance:** Asymmetric balance replaces rigid modular grids where appropriate, giving cards human warmth without compromising the pragmatic utility of rental operations.

## Colors

The palette draws directly from organic matter, traditional ceramics, sumi ink calligraphy, and natural moss gardens:

- **Canvas & Paper (Surfaces):** The base background is `#F7F4EE` (warm linen / raw washi), creating a restful surface. Layered cards use `#EFECE6` (sun-bleached ecru) and `#FDFBF7` (subtle highlight).
- **Sumi Charcoal (Text & Structure):** Replaces clinical harsh black. The primary text color is `#2B2927` (deep sumi ink), with secondary labels in `#68635D` (wood smoke) and tertiary data in `#948E85` (stone grey).
- **Unglazed Terracotta & Wood Bark (Primary Brand Accent):** `#8C6239` (fired earth) serves as the primary focal tone for key calls to action, selected active tabs, and critical milestones, supported by `#A67C52` (warm sandstone).
- **Koke Moss (Success & Nature Accent):** `#5D6654` (shaded moss green) evokes quiet reassurance, replacing aggressive lime greens for paid badges, active tenant room tags, and resolved service logs.
- **Muted Persimmon / Ochre (Gentle Warnings):** Overdue bills and pending notices shift away from aggressive warning banners to a gentle roasted ochre (`#C27D38` / `#F5EBE1` tint) that maintains composure while signaling action.
- **Delicate Boundaries:** Surface separation relies on `#2B2927` applied at `0.08` opacity (`rgba(43, 41, 39, 0.08)`), resembling a hand-drawn graphite rule rather than a digital box edge.

## Typography

The typographical pairing anchors the dialogue between timeless organic tradition and contemporary mobile clarity:

1. **The Editorial Voice (`Noto Serif`):** Reserved for greetings, section milestones, tenant names, and introspective section headers (e.g., *“Tagihan & Pembayaran”*, *“Lapor Kerusakan”*, *“Selamat Pagi, Rinaldi”*). It evokes the quiet dignity of printed literary journals and tranquil boutique hospitality.
2. **The Functional Voice (`Plus Jakarta Sans`):** Used for transactional figures, Indonesian Rupiah amounts, due dates, room numbers, and navigation titles. Its open apertures and balanced geometric proportions provide crisp legibility on compact mobile screens under shifting natural light.
3. **Hierarchy & Nuance:**
   - Section category overlines (e.g., `TAGIHAN ANDA`, `DURASI SEWA`) use `label-sm` rendered in uppercase with generous letter tracking (`0.08em`) in `#68635D`, creating quiet editorial cadences between card groups.
   - Financial totals and currency metrics utilize medium-bold weights in `currency-display` rather than harsh black weights, preserving aesthetic serenity without compromising fast cognitive parsing.

## Layout & Spacing

The layout treats whitespace as *Ma* (間)—the negative space that gives breath, stillness, and substance to interface elements.

- **Mobile Viewport System:** Built as a single-column fluid shell constrained to a maximum width of `430px` on mobile PWA wrappers, centered gracefully on tablet screens with warm atmospheric side margins.
- **Vertical Rhythm:**
  - Outer screen horizontal padding is consistently `1.25rem` (`20px`), ensuring edge safety for finger tap zones.
  - Section blocks are separated by `2rem` (`32px`) of open breathing room. Grouped items inside cards follow a tight `0.75rem` (`12px`) or `1rem` (`16px`) cadence.
- **Top Bar & Safe Areas:** The PWA status header floats with a translucent blur, accommodating dynamic island and notch offsets with `env(safe-area-inset-top) + 0.75rem`.
- **Bottom Dock Navigation:** Fixed bottom navigation with a height of `4.25rem` (`68px`) plus `env(safe-area-inset-bottom)`, raising interactive touch targets safely above OS home indicators while keeping main content scroll buffers comfortable.

## Elevation & Depth

This design system avoids steep drop shadows, harsh ambient occlusion, and sterile computer-generated glow effects. Instead, depth is communicated through **Textured Tonal Layers** and **Low-Contrast Outlines**:

- **Layer 0 (Sanctuary Canvas):** `#F7F4EE` warm linen background.
- **Layer 1 (Card & Module Surfaces):** `#EFECE6` soft stone surface or `#FDFBF7` clean washi paper surface.
- **Layer 2 (Floating Action Trays & Modal Drawers):** `#FAF8F3` elevated with an ultra-soft organic shadow: `0 8px 30px -4px rgba(43, 41, 39, 0.05), 0 2px 6px 0 rgba(43, 41, 39, 0.03)`.
- **The Whisper Border:** Rather than harsh borders, all cards, radio tiles, and input segments are edged with `1px solid rgba(43, 41, 39, 0.07)` (`#2B2927` at 7% alpha), offering tactile edge definition reminiscent of bookbinding folds.
- **Glass & Translucency:** Top utility bars and floating bottom navigation use high-density backdrop blur (`backdrop-filter: blur(16px)`) with an 88% opaque ecru tint (`rgba(247, 244, 238, 0.88)`), creating continuity as cards slide beneath.

## Shapes

The shape system draws inspiration from water-worn pebbles (*ishi*) and carved earthenware:

- **Cards & Primary Modules:** Employ `rounded-lg` (`1rem` / `16px`), conveying welcoming softness and warmth while preserving structural alignment.
- **Action Buttons & Inputs:** Use `0.75rem` (`12px`) to `1rem` (`16px`) rounded corners to feel comfortable and tactile when tapped.
- **Status Badges & Chips:** Feature full pill shapes (`rounded-full` / `9999px`) to contrast harmoniously against square card corners.
- **Icon Enclosures & Avatars:** Nest inside soft organic rounded squares (`12px` radius) or smooth circles with warm taupe fills (`rgba(140, 98, 57, 0.08)`).

## Components

### 1. Buttons
- **Primary Action (e.g., *Bayar Sekarang*, *Lapor Kerusakan*):** 
  - Background: Terracotta sumi gradient or solid `#8C6239`.
  - Text: `#FDFBF7`, `title-md` font weight 600.
  - Height: `52px` full-width touch zone, `14px` border-radius.
  - State: Active press slightly darkens to `#76522E` with a subtle scale transform (`scale(0.985)`).
- **Secondary / Ghost Button (e.g., *Download CSV*, *Transfer Manual*):** 
  - Background: `rgba(43, 41, 39, 0.04)`, border `1px solid rgba(43, 41, 39, 0.1)`.
  - Text: `#2B2927`, `title-md`.

### 2. Status Chips & Badges
- **Unpaid / Pending (*Belum Bayar*):** 
  - Background: Soft ochre wash `#F5EBE1`.
  - Text: `#9E5D26`, `label-sm` weight 600.
  - Icon: Miniature sun/clock glyph.
- **Paid / Active (*Lunas*, *Kamar 005*):** 
  - Background: Soft moss tint `#EFF2EC`.
  - Text: `#4D5745`, `label-sm` weight 600.
  - Left indicator: `6px` organic moss dot `#5D6654`.

### 3. Payment Method Selection Tiles (Radio Cards)
- Replaces the generic dark list items with tactile, separated ceramic cards.
- Background: `#FDFBF7` with `1px solid rgba(43, 41, 39, 0.08)`.
- Selected State: Outlined with `1.5px solid #8C6239`, with a warm interior glow `rgba(140, 98, 57, 0.03)`.
- Radio Node: Custom ring in `#8C6239` encasing an earthy sumi dot, departing from default OS form controls.

### 4. Tenant Header & Room Pill
- Top bar displays room badge (*Kamar 005*) in a moss-tinted pill badge next to the tranquil bell notification.
- Tenant Greeting (*Selamat Pagi, Rinaldi Mulya Pratama*) pairs a welcoming `body-sm` overline in `#68635D` with an expressive `headline-md` in `Noto Serif`.

### 5. Maintenance Ticket Cards (*Lapor Kerusakan*)
- Image attachments feature rounded `10px` inner borders with an unbleached paper border matting (`rgba(43, 41, 39, 0.06)`).
- Status flags sit quietly in the card header, avoiding jarring visual urgency while providing clear status updates.

### 6. Bottom Navigation Bar
- Fixed bottom dock with linen blur background (`rgba(247, 244, 238, 0.9)`).
- Navigation icons: Custom minimal 1.5px line-weight glyphs. Active tab features warm terracotta tint (`#8C6239`) with an organic terracotta dot beneath the label, while inactive items rest in muted wood charcoal (`#948E85`).