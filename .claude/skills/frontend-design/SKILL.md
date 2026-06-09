---
name: frontend-design
description: Design principles for distinctive frontends — typography, color systems, motion, micro-interactions, and anti-patterns to avoid
paths:
  - "**/*.tsx"
  - "**/*.jsx"
  - "**/*.html"
  - "**/*.css"
---

# Frontend Design Skill

## Purpose

Create distinctive, memorable frontends that avoid generic AI-generated design patterns. Emphasize typography, color cohesion, motion, and intentional interactions.

## Principles

### 1. Distinctive Typography
- Use Google Fonts strategically for personality (serif + sans-serif combinations)
- Implement proper typographic hierarchy with `clamp()` for responsive scaling
- Employ letter-spacing and font-weight strategically for emphasis
- Avoid: Default system fonts, inconsistent font sizes, poor line-height

### 2. Cohesive Color Systems
- Define CSS variables for semantic color naming (primary, accent, background, text)
- Use gradients sparingly but effectively for visual interest
- Maintain contrast ratios (WCAG AA minimum 4.5:1 for text)
- Create a 5-8 color palette with defined relationships
- Avoid: Random hex colors, unnamed colors scattered across CSS

### 3. Orchestrated Motion & Animation
- Apply staggered animations (offset delays) to sequenced elements
- Use easing functions like `cubic-bezier(0.34, 1.56, 0.64, 1)` for personality
- Animate transforms (scale, rotate, translateY) not properties that trigger layout
- Provide visual feedback on interactive elements (hover, focus)
- Avoid: Motion that doesn't serve purpose, jarring animations, excessive transitions

### 4. High-Impact Micro-Interactions
- Hover states that provide feedback (scale, color shift, border change)
- Animated underlines on navigation links
- Smooth transitions on state changes
- Loading states and visual confirmations
- Avoid: Static, unresponsive interfaces

### 5. Layout & Spacing
- Use CSS custom properties for consistent spacing
- Implement max-width containers for readability
- Use CSS Grid and Flexbox with proper gap management
- Responsive design with mobile-first approach
- Avoid: Fixed pixels, inconsistent spacing, layouts that don't adapt

### 6. Anti-Patterns to Avoid (AI Slop)
- Flat, colorless purple/blue gradients without intention
- System font with no personality
- Pure white backgrounds with gray text
- Generic emoji icons
- No visual hierarchy or emphasis
- Static content with zero interactivity

## Implementation Checklist

- [ ] Define CSS variables for colors, spacing, typography
- [ ] Implement 2+ custom Google Fonts with clear hierarchy
- [ ] Add entrance animations with staggered delays
- [ ] Include hover/focus states on interactive elements
- [ ] Implement semantic color naming
- [ ] Ensure mobile responsiveness with @media queries
- [ ] Test contrast ratios with accessibility tools
