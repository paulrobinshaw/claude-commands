# Version Strategy Template

**INSTRUCTIONS:** Copy this template to `.claude/project/version.md` and customize for your project's version requirements.

---

## Version Strategy

**Project:** [Your Project Name]

**Technology:** [iOS/Android/Web/React Native/Flutter/etc.]

**Last Updated:** [YYYY-MM-DD]

---

## Version Targets

### Target Version

**Version:** [e.g., iOS 18.0+, Android 14+, React 18+, etc.]

**Why:** [Reason for choosing this target version - latest features, performance, etc.]

**Features Available:**
- [Key feature 1 available in this version]
- [Key feature 2 available in this version]
- [Key feature 3 available in this version]

**Release Date:** [When this version was released]

**Adoption Rate:** [Current adoption percentage, if known]

---

### Minimum Supported Version

**Version:** [e.g., iOS 17.0+, Android 12+, React 16+, etc.]

**Why:** [Reason for this minimum - balance of features and device coverage]

**Coverage:** [Percentage of users/devices covered, if known]

**Key Features Available:**
- [Critical feature 1 needed for your app]
- [Critical feature 2 needed for your app]
- [Critical feature 3 needed for your app]

**Release Date:** [When this version was released]

**Limitations:**
- [What's not available below this version]
- [What requires @available or equivalent checks]

---

### Deprecated Versions

**No Longer Supported:**
- [Version X and below] - Dropped [Month Year]

**Reason:**
- [Why these versions were dropped]
- [What percentage of users this affected]

---

## Architecture Patterns by Version

### Use These Patterns

**For [Minimum Version]+ (Minimum Supported):**

✅ **[Pattern 1 Name]**
- **Available:** [Version]+
- **Why:** [Reason to use this pattern]
- **Example:**

```[language]
// Example code showing pattern
[code example]
```

✅ **[Pattern 2 Name]**
- **Available:** [Version]+
- **Why:** [Reason to use this pattern]
- **Example:**

```[language]
// Example code showing pattern
[code example]
```

✅ **[Pattern 3 Name]**
- **Available:** [Version]+
- **Why:** [Reason to use this pattern]
- **Example:**

```[language]
// Example code showing pattern
[code example]
```

[Add all modern patterns that should be used]

---

### Avoid These Patterns

**Deprecated/Legacy:**

❌ **[Old Pattern 1 Name]**
- **Replaced by:** [New pattern name]
- **Available in:** [Old version range]
- **Why avoid:** [Reason - deprecated, better alternative exists, etc.]
- **Migration:** [How to migrate from old to new]

```[language]
// Don't do this
[old pattern code]  // ❌

// Do this instead
[new pattern code]  // ✅
```

❌ **[Old Pattern 2 Name]**
- **Replaced by:** [New pattern]
- **Available in:** [Version range]
- **Why avoid:** [Reason]
- **Migration:** [How to migrate]

```[language]
// Don't do this
[old pattern code]  // ❌

// Do this instead
[new pattern code]  // ✅
```

❌ **[Old Pattern 3 Name]**
- **Replaced by:** [New pattern]
- **Why avoid:** [Reason]
- **Migration:** [How to migrate]

[Add all deprecated patterns to avoid]

---

## Version-Specific Guidelines

### For [Minimum Version]+ (Minimum Supported)

#### Core Patterns

**[Category 1, e.g., State Management]:**
- ✅ Use [Pattern A] for [use case]
- ✅ Use [Pattern B] for [use case]
- ✅ Use [Pattern C] for [use case]
- ❌ Never use [Old Pattern]

**[Category 2, e.g., UI Components]:**
- ✅ Use [Component A] for [use case]
- ✅ Use [Component B] for [use case]
- ❌ Never use [Deprecated Component]

**[Category 3, e.g., Async Operations]:**
- ✅ Use [Pattern A] for [use case]
- ✅ Use [Pattern B] for [use case]
- ❌ Don't use [Old Approach]

**[Category 4, e.g., Navigation]:**
- ✅ Use [Navigation System A]
- ✅ Use [Navigation Pattern B]
- ❌ Don't use [Deprecated Navigation]

**[Category 5, e.g., Data Persistence]:**
- ✅ Use [Persistence System A]
- ✅ Use [Persistence Pattern B]
- ❌ Avoid [Old System]

---

#### When to Use Version Checks

Use version checks (like `@available`, `if (Build.VERSION.SDK_INT >=`, etc.) sparingly, only for [Target Version]+ features:

**Example:**

```[language]
if (version_check_for_target_version) {
    // Target version-only feature
    // (use sparingly, most code should work on minimum version)
} else {
    // Minimum version fallback
}
```

**When to use version checks:**
- [Scenario 1, e.g., "New animations in target version"]
- [Scenario 2, e.g., "Target version-only APIs"]
- [Scenario 3, e.g., "Experimental features"]

**When NOT to use version checks:**
- [Pattern 1] ([Version]+, our minimum) - No check needed
- [Pattern 2] ([Lower Version]+, below our minimum) - No check needed
- [Pattern 3] ([Version]+, our minimum) - No check needed

---

## Migration Strategy

### Upgrading Minimum Version

**Current:** [Current Minimum Version]

**When to Upgrade to [Next Version]+:**
- Adoption rate > [X]% (estimated: [Date])
- [Next Version] features become critical
- [Current Version] has significant bugs/security issues

**Migration Steps:**
1. Monitor adoption rates [frequency, e.g., quarterly]
2. When [Next Version] adoption > [X]%:
   - Update minimum deployment target
   - Remove version checks for [Next Version] features
   - Use [Next Version] features directly
   - Update documentation

**Deprecation Notice:**
- Announce [X] months before dropping [Current Version]
- Notify users via [channel, e.g., app update notes]
- Provide migration guide for affected features

---

### Adopting New Features

**Evaluation Criteria:**
- Adoption rate: [X]% of users on version with feature
- Stability: Feature is production-ready (not beta)
- Benefits: Clear advantages over current approach
- Effort: Migration effort is reasonable

**Adoption Process:**
1. Test feature in isolated branch
2. Evaluate benefits vs effort
3. If worth it: Plan migration
4. Gradual rollout with version checks (if needed)
5. Once minimum version raised: Remove version checks

---

## Platform-Specific Considerations

### Device Support

**Target Devices:**
- [Device category 1]: [Description, e.g., "iPhone XS and later"]
- [Device category 2]: [Description, e.g., "iPad (6th gen+)"]
- [Device category 3]: [Not planned, if applicable]

**Screen Sizes:**
- [Platform-specific screen size range]

---

### Performance Targets

**Target Performance:**
- Launch time: [Target, e.g., "< 2 seconds (cold start)"]
- Frame rate: [Target, e.g., "60 FPS for UI interactions"]
- [Specific metric 1]: [Target and description]
- [Specific metric 2]: [Target and description]
- Memory: [Target, e.g., "< 100 MB typical usage"]
- Battery: [Target, e.g., "< 5% per hour active use"]

---

## Compatibility Matrix

### Feature Availability

| Feature | [Target Version] | [Minimum Version] | Fallback |
|---------|------------------|-------------------|----------|
| [Feature 1] | ✅ | ✅ | N/A (required) |
| [Feature 2] | ✅ | ✅ | N/A (required) |
| [Feature 3] | ✅ | ⚠️ Partial | [Fallback approach] |
| [Feature 4] | ✅ | ❌ | Use version check |
| [Feature 5] | ✅ | ❌ | [Alternative approach] |

---

## Testing Strategy

### Version Testing

**Test Matrix:**
- [Target Version]: Full test suite on latest
- [Minimum Version]: Core functionality, edge cases
- [Below Minimum]: Verify app doesn't launch or shows deprecation

**Testing Approach:**
- **Simulators/Emulators:** [List versions to test]
- **Real devices:**
  - [Device 1] ([Version 1])
  - [Device 2] ([Version 2])
  - [Device 3] ([Version 3])
- **Automated:** CI/CD runs tests on [versions]
- **Manual:** Critical paths tested on real devices

---

## Update Schedule

**Review Frequency:** [How often to review, e.g., "Every 6 months"]

**Next Review:** [Date]

**Triggers for Early Review:**
- New major version released
- Security vulnerability requiring version bump
- Significant shift in adoption rates
- Critical new feature becomes must-have

---

## Documentation References

**Official Documentation:**
- [Link to official platform documentation]
- [Link to framework documentation]

**Release Notes:**
- [Link to version release notes]
- [Link to migration guides]

**Community Resources:**
- [Link to community guides]
- [Link to best practices]

---

## Dependency Versions

### Core Dependencies

**[Dependency 1 Name]:**
- **Current Version:** [Version]
- **Minimum Version:** [Minimum supported]
- **Update Policy:** [When/why to update]

**[Dependency 2 Name]:**
- **Current Version:** [Version]
- **Minimum Version:** [Minimum supported]
- **Update Policy:** [When/why to update]

**[Dependency 3 Name]:**
- **Current Version:** [Version]
- **Minimum Version:** [Minimum supported]
- **Update Policy:** [When/why to update]

[List all major dependencies]

---

### Dependency Update Strategy

**When to Update:**
- Security patches: Immediately
- Minor versions: [Frequency, e.g., "Quarterly"]
- Major versions: [Approach, e.g., "Evaluate impact, plan migration"]

**Testing After Updates:**
1. Run full test suite
2. Test on all supported versions
3. Verify no breaking changes
4. Update documentation if APIs changed

---

## Breaking Changes Policy

**How to Handle Breaking Changes:**

**In Your Code:**
1. Announce [X] versions ahead
2. Provide deprecation warnings
3. Offer migration path
4. Support old API for [X] versions

**In Dependencies:**
1. Evaluate impact before upgrading
2. Test thoroughly on all supported versions
3. Update code to new APIs
4. Update documentation

**Communication:**
- Document all breaking changes in release notes
- Provide code examples for migration
- Update guides and tutorials

---

## Version-Specific Workarounds

### Workaround 1: [Issue Name]

**Issue:** [Description of bug/limitation in specific version]

**Affects:** [Version range]

**Workaround:**
```[language]
// Code showing workaround
if (specific_version_check) {
    // Workaround for affected versions
} else {
    // Normal code
}
```

**Remove When:** [Condition, e.g., "Minimum version raised to X"]

---

### Workaround 2: [Issue Name]

**Issue:** [Description]

**Affects:** [Version range]

**Workaround:**
[Code or approach]

**Remove When:** [Condition]

---

## Notes

- This version strategy is specific to [Project Name]
- Review adoption rates [frequency]
- Plan next minimum version upgrade for [approximate date]
- Run `/prime` after updates to reload strategy
- Keep workarounds documented and remove when no longer needed
- Test thoroughly on both minimum and target versions
- Communicate version changes clearly to users
