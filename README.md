# Haven — Luxury Real Estate Discovery App

A premium Flutter showcase app designed to feel like a high-budget real estate product.

Built for portfolio credibility, client demos, and fast sales conversations.

## Live Concept

Haven demonstrates a polished property discovery flow with:

- cinematic hero imagery
- glassmorphism search and filter UX
- premium typography and spacing system
- interactive city/map-like discovery
- favorites flow and state persistence during session
- smooth navigation and page transition animations

## Why this project wins clients

This app is intentionally designed to prove production-level UI capability:

- **Premium visual execution** (luxury styling, hierarchy, micro-interactions)
- **Product thinking** (discovery → detail → action flow)
- **Demo readiness** (10 real listings with rich content and responsive behavior)
- **Mobile-first polish** (safe-area handling, overflow fixes, bottom navigation patterns)

If you are pitching to real estate, fintech, lifestyle, or marketplace clients, this codebase showcases the exact quality bar they expect.

## Feature Highlights

### Discovery Experience
- Search by property name, city, or address
- Filter sheet with:
	- minimum bedrooms
	- max price
	- pool-only toggle
- Active filter chips + clear action

### Listing System
- 10 curated estate listings with high-quality remote imagery
- Premium property cards with gradient overlays and save actions
- Staggered list entrance animations for high-end feel

### Property Detail Screen
- Hero image transition from card to detail
- Floating glass search bar overlay
- Luxury details layout: serif pricing + clean amenities + description
- Fixed CTA bar: `Schedule Viewing` + `Save`

### Navigation & Motion
- Bottom icon navigation: Discover, Saved, Map, Profile
- Direction-aware animated tab transitions (slide + fade)
- Animated city selection in map tab
- Animated icon transitions for favorite state

## Tech Stack

- **Framework:** Flutter (Material 3)
- **Language:** Dart
- **Typography:** `google_fonts` (Playfair Display + Inter)
- **Architecture:** Componentized UI with reusable stateless/stateful widgets
- **State Handling:** Local state (`setState`) optimized for fast demos

## Project Structure

Main implementation is in:

- [lib/main.dart](lib/main.dart)

The project is currently built as a single-file showcase for speed and portability in portfolio reviews. It can be split into feature modules (`features/discover`, `features/details`, `features/profile`) for production scaling.

## Run Locally

### Prerequisites

- Flutter SDK 3.41+
- Dart SDK (bundled with Flutter)

### Install dependencies

```bash
flutter pub get
```

### Run on web

```bash
flutter run -d web-server --web-port 8084
```

Then open:

```text
http://localhost:8084
```

### Run on iOS / Android simulator

```bash
flutter run
```

## Quality Notes

- Overflow and layout edge-cases have been addressed for demo reliability.
- Search and filters are fully interactive and wired to listing data.
- Map tab is action-enabled (city selection routes results back to discover).

## Portfolio Presentation Tips (Use this to close deals faster)

When demoing to clients:

1. Start on **Discover** and show instant search responsiveness.
2. Open **Filters** and apply constraints live.
3. Enter a listing to show **Hero transition** + premium detail layout.
4. Save listings and switch to **Saved** tab.
5. Use **Map tab city selection** to demonstrate product flow logic.

This sequence tells a complete product story in under 2 minutes.

## Build-in-Public Post Hook (LinkedIn)

> I rebuilt a luxury real-estate app experience in Flutter with premium motion design, filter logic, and conversion-focused UX — from concept to demo-ready in a single sprint. Want the case study + source walkthrough?

## Contact / Hiring Note

If you want this adapted into your brand with backend integration (auth, CMS, bookings, maps, analytics), this codebase is ready to evolve into a production app.
