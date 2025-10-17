# Domain Knowledge: Professional Baking App

This domain knowledge is specific to the professional baking application example.

---

## Domain Knowledge

**Project:** Professional Baking App (Example)

**Domain:** Professional Baking / Baker's Percentages

**Last Updated:** 2024-10-17

---

## Domain Overview

**Purpose:** This application helps professional bakers create, scale, and manage bread formulas using baker's percentages - the universal language of professional baking where all ingredients are expressed as percentages of the total flour weight (flour = 100%).

**Key Concepts:**
1. **Baker's Percentage:** All ingredients expressed as % of flour weight
2. **Hydration:** Water content as % of flour (determines dough consistency)
3. **Formula:** Recipe expressed in percentages (not absolute weights)
4. **Preferment:** Pre-fermented portion of dough for enhanced flavor
5. **Scaling:** Converting formula percentages to actual weights for production

**Target Users:**
- **Professional Bakers:** Create and scale formulas for daily production
- **Bakery Managers:** Manage recipe library, calculate ingredient costs
- **Culinary Students:** Learn professional baking through proper formulas

---

## Domain Entities

### Entity 1: Formula

**Description:** A bread formula expressed in baker's percentages where flour = 100% and all other ingredients are percentages of that flour weight.

**Properties:**
- `name` (String): Formula name (e.g., "Artisan Sourdough")
- `flour_percentage` (Double): Always 100% (baseline)
- `water_percentage` (Double): Water as % of flour (hydration)
- `salt_percentage` (Double): Typically 1.8-2.2%
- `yeast_percentage` (Double): Typically 0.5-2% (less = longer fermentation)
- `preferment_percentage` (Double): 0-40% (poolish, biga, levain)
- `other_ingredients` (Array): Fats, sugar, etc. with percentages

**Relationships:**
- One Formula has many Ingredients
- One Formula may have one Preferment

**Business Rules:**
1. Flour percentage MUST equal exactly 100%
2. Water percentage typically 50-90% (warn if outside)
3. Salt percentage typically 1.8-2.2% (warn if outside)
4. Yeast percentage typically 0.5-2%
5. Total percentage > 100% (flour + water + salt + yeast + others)

**Example:**
```
Formula: "Artisan Sourdough"
Flour: 100% (baseline)
Water: 70% (hydration)
Salt: 2%
Yeast: 1%
Total: 173%
```

**Validation:**
- Flour must equal 100%
- Water must be > 0%
- Salt 1.5-2.5% recommended
- All percentages must be positive

---

### Entity 2: Recipe

**Description:** A formula scaled to specific production weights with actual gram amounts for each ingredient.

**Properties:**
- `formula` (Formula): The base formula
- `total_flour_weight` (Double): Target flour amount in grams
- `ingredients` (Array): Calculated gram amounts for each ingredient

**Relationships:**
- One Recipe belongs to one Formula
- One Recipe has many IngredientAmounts

**Business Rules:**
1. All amounts calculated from formula percentages
2. Total flour weight determines all other weights
3. Amounts rounded to nearest gram (or 0.1g for small batches)

**Example:**
```
Formula: "Artisan Sourdough" (70% hydration)
Total Flour: 1000g
Calculated:
- Flour: 1000g (100%)
- Water: 700g (70%)
- Salt: 20g (2%)
- Yeast: 10g (1%)
```

**Validation:**
- Total flour weight must be > 0
- All calculated amounts must be positive

---

### Entity 3: Preferment

**Description:** A portion of the flour and water mixed ahead of time and fermented to develop flavor. Common types: poolish (100% hydration), biga (50-60% hydration), levain (sourdough starter).

**Properties:**
- `type` (String): "poolish", "biga", or "levain"
- `flour_percentage` (Double): % of total formula flour (typically 10-30%)
- `hydration_percentage` (Double): Water as % of preferment flour (e.g., 100% for poolish)
- `fermentation_time` (Int): Hours to ferment before use

**Relationships:**
- One Preferment belongs to one Formula
- Preferment flour is part of total flour (not additional)

**Business Rules:**
1. Preferment flour is subtracted from final dough flour
2. Preferment water is subtracted from final dough water
3. Poolish is always 100% hydration (equal flour and water)
4. Biga is 50-60% hydration (stiff preferment)
5. Levain is typically 75-100% hydration

**Example:**
```
Formula: "French Baguette with Poolish"
Total Flour: 100%
Preferment: 20% poolish (100% hydration)

Poolish:
- Flour: 20% (20g per 100g total flour)
- Water: 20% (100% of poolish flour = 20g)

Final Dough:
- Flour: 80% (remaining from 100% total)
- Water: 50% (to reach 70% total hydration)
- Salt: 2%
- Yeast: 1%
```

**Validation:**
- Preferment flour % must be ≤ 40% (warn if higher)
- Hydration must match type (poolish = 100%, biga = 50-60%)

---

## Domain Calculations

### Calculation 1: Hydration Percentage

**Purpose:** Calculate water content as a percentage of flour weight, which determines dough consistency.

**Formula:**
```
hydration_percentage = (total_water_weight / total_flour_weight) × 100
```

**Inputs:**
- `total_flour_weight` - Total flour in grams (including preferment flour)
- `total_water_weight` - Total water in grams (including preferment water)

**Output:**
- `hydration_percentage` - Water as % of flour

**Example:**

Input: 1000g flour, 700g water
Calculation: (700 / 1000) × 100 = 70%
Output: "This bread has 70% hydration"

**Edge Cases:**
- If flour = 0: Error "Flour weight required"
- If water = 0: 0% hydration (unusual, warn)
- If hydration < 50%: Warn "Very stiff dough"
- If hydration > 90%: Warn "Very wet dough (ciabatta-style)"

**Validation:**
- Flour weight must be > 0
- Water weight must be ≥ 0
- Result should typically be 50-90%

---

### Calculation 2: Ingredient Weight from Percentage

**Purpose:** Convert baker's percentage to actual weight in grams.

**Formula:**
```
ingredient_weight = (ingredient_percentage / 100) × total_flour_weight
```

**Inputs:**
- `ingredient_percentage` - Baker's percentage (e.g., 70 for 70%)
- `total_flour_weight` - Total flour in grams

**Output:**
- `ingredient_weight` - Weight in grams

**Example:**

Input: 70% water, 1000g flour
Calculation: (70 / 100) × 1000 = 700g
Output: 700g water

**Edge Cases:**
- Round to nearest gram for amounts > 10g
- Round to 0.1g for amounts < 10g (precision for small batches)
- If percentage = 0: 0g (ingredient not used)

**Validation:**
- Percentage must be ≥ 0
- Flour weight must be > 0

---

### Calculation 3: Total Dough Weight

**Purpose:** Calculate total dough weight from formula percentages.

**Formula:**
```
total_percentage = sum of all ingredient percentages (flour + water + salt + yeast + others)
total_dough_weight = (total_percentage / 100) × total_flour_weight
```

**Inputs:**
- `formula` - Formula with all ingredient percentages
- `total_flour_weight` - Total flour in grams

**Output:**
- `total_dough_weight` - Total dough weight in grams

**Example:**

Formula: Flour 100%, Water 70%, Salt 2%, Yeast 1%
Total percentage: 100 + 70 + 2 + 1 = 173%
Flour: 1000g
Total dough weight: (173 / 100) × 1000 = 1730g

Output: 1730g total dough

**Edge Cases:**
- Include all ingredients in sum
- Don't forget small percentages (salt, yeast)

**Validation:**
- Total percentage must be > 100% (at minimum, flour + something)
- Flour weight must be > 0

---

### Calculation 4: Preferment Quantities

**Purpose:** Calculate flour and water amounts for a preferment (poolish, biga, levain).

**Formula:**
```
preferment_flour = (preferment_percentage / 100) × total_flour_weight
preferment_water = preferment_flour × (preferment_hydration / 100)
```

**Inputs:**
- `preferment_percentage` - % of total flour used in preferment (e.g., 20%)
- `preferment_hydration` - Hydration of preferment (e.g., 100% for poolish)
- `total_flour_weight` - Total flour in grams

**Output:**
- `preferment_flour` - Flour in preferment (grams)
- `preferment_water` - Water in preferment (grams)

**Example:**

Input: 20% poolish (100% hydration), total_flour = 1000g
Calculation:
preferment_flour = 0.20 × 1000 = 200g
preferment_water = 200 × (100 / 100) = 200g

Output: 200g flour, 200g water in poolish

**Edge Cases:**
- Poolish always 100% hydration
- Biga typically 50-60% hydration
- Levain typically 75-100% hydration

**Validation:**
- Preferment percentage must be 0-40% (warn if > 40%)
- Hydration must be appropriate for preferment type

---

### Calculation 5: Recipe Scaling

**Purpose:** Scale a recipe from one flour amount to another.

**Formula:**
```
scaling_factor = target_flour_weight / original_flour_weight
new_ingredient_weight = original_ingredient_weight × scaling_factor
```

**Inputs:**
- `original_flour_weight` - Original total flour in grams
- `target_flour_weight` - Desired total flour in grams
- `original_ingredient_weight` - Weight of ingredient in original recipe

**Output:**
- `new_ingredient_weight` - Scaled ingredient weight in grams

**Example:**

Original: 1000g flour, 700g water
Target: 500g flour

Scaling factor: 500 / 1000 = 0.5
New water: 700 × 0.5 = 350g

Output: 350g water for 500g flour recipe

**Edge Cases:**
- Round to nearest gram for most ingredients
- For yeast, suggest adjustment (not strict scaling) for very large/small batches

**Validation:**
- Original flour weight must be > 0
- Target flour weight must be > 0
- Scaling factor should be reasonable (0.1 to 10x)

---

## Domain Language

### Key Terms

**Baker's Percentage**
- **Definition:** Ratio of ingredient weight to total flour weight, expressed as percentage
- **Context:** Used in all professional formulas
- **Example:** "This bread has 70% hydration" means water is 70% of flour weight

**Hydration**
- **Definition:** Water content as percentage of flour weight
- **Context:** Describes dough consistency
- **Example:** "Ciabatta typically has 80% hydration"

**Preferment**
- **Definition:** Pre-fermented portion of dough added to final dough
- **Context:** Used to improve flavor and texture
- **Example:** "This formula uses a 20% poolish"

**Poolish**
- **Definition:** Liquid preferment with 100% hydration (equal weights flour and water)
- **Context:** Common in French bread baking
- **Example:** "Make the poolish 12 hours before mixing final dough"

**Biga**
- **Definition:** Stiff Italian preferment with 50-60% hydration
- **Context:** Common in Italian bread baking
- **Example:** "The biga gives this focaccia great flavor"

**Levain**
- **Definition:** Naturally-leavened sourdough starter
- **Context:** Used instead of commercial yeast
- **Example:** "Feed the levain 8 hours before baking"

**Formula**
- **Definition:** Recipe expressed in baker's percentages
- **Context:** Professional bakers use formulas, not recipes
- **Example:** "Can you send me the formula for that baguette?"

**Autolyse**
- **Definition:** Resting period where flour and water mix before adding salt and yeast
- **Context:** Improves gluten development and extensibility
- **Example:** "Autolyse for 30 minutes before adding salt"

**Bulk Fermentation**
- **Definition:** First fermentation period after mixing
- **Context:** Dough develops flavor and structure
- **Example:** "Bulk fermentation is 3 hours with folds every 30 minutes"

**Proofing**
- **Definition:** Final fermentation after shaping
- **Context:** Dough rises before baking
- **Example:** "Proof for 1 hour until doubled in size"

**Straight Dough**
- **Definition:** Method where all ingredients mixed at once (no preferment)
- **Context:** Faster method, less flavor development
- **Example:** "This is a straight dough method, ready in 4 hours"

**Oven Spring**
- **Definition:** Rapid rise in the oven from steam and heat
- **Context:** Creates open crumb structure
- **Example:** "Good oven spring means proper fermentation"

**Crumb**
- **Definition:** Interior structure of bread (open/tight, even/uneven)
- **Context:** Quality indicator
- **Example:** "This bread has a beautiful open crumb"

---

### Acronyms and Abbreviations

**BP** - Baker's Percentage
- **Meaning:** Ingredient ratio to flour
- **Usage:** "Water is 70 BP"

**DDT** - Desired Dough Temperature
- **Meaning:** Target temperature after mixing
- **Usage:** "Aim for 75°F DDT"

**BF** - Bulk Fermentation
- **Meaning:** First rise period
- **Usage:** "BF is 3 hours"

**FF** - Final Fermentation (Proofing)
- **Meaning:** Second rise after shaping
- **Usage:** "FF is 1 hour"

---

## Domain Workflows

### Workflow 1: Creating a New Formula

**Purpose:** Create a new bread formula using baker's percentages

**Steps:**

1. **Define Flour (100%)**
   - Input: Type(s) of flour, total = 100%
   - Action: Set flour as baseline
   - Output: Flour = 100%
   - Example: Bread flour 80% + Whole wheat 20% = 100%

2. **Set Hydration**
   - Input: Desired dough consistency
   - Action: Choose water percentage based on bread type
   - Output: Water percentage
   - Example: 70% for artisan bread

3. **Add Salt (1.8-2.2%)**
   - Input: Standard salt ratio
   - Action: Set salt percentage
   - Output: Salt percentage
   - Example: 2% salt

4. **Add Yeast (0.5-2%)**
   - Input: Fermentation time desired
   - Action: Set yeast percentage (less yeast = longer fermentation)
   - Output: Yeast percentage
   - Example: 1% for 3-hour bulk fermentation

5. **Add Preferment (Optional, 10-30%)**
   - Input: Desired flavor complexity
   - Action: Define preferment type and percentage
   - Output: Preferment specification
   - Example: 20% poolish (100% hydration)

6. **Validate Formula**
   - Input: Complete formula
   - Action: Check flour = 100%, reasonable hydration, etc.
   - Output: Validation result
   - Example: ✅ Valid formula

**Success Criteria:**
- Flour totals 100%
- Hydration is reasonable for bread type
- All percentages calculated correctly

**Error Handling:**
- If flour ≠ 100%, alert user
- If hydration seems unusual, warn user
- If salt > 3%, warn (too salty)

---

### Workflow 2: Scaling a Formula

**Purpose:** Scale a formula from one size to another

**Steps:**

1. **Get Original Formula**
   - Input: Formula with baker's percentages
   - Action: Load formula data
   - Output: Original formula

2. **Specify Target Flour Weight**
   - Input: Desired flour amount (e.g., 2000g instead of 1000g)
   - Action: Store target
   - Output: Target flour weight

3. **Calculate Scaling Factor**
   - Input: Original flour, target flour
   - Action: scaling_factor = target / original
   - Output: Scaling factor
   - Example: 2000 / 1000 = 2.0

4. **Scale All Ingredients**
   - Input: Original amounts, scaling factor
   - Action: Multiply each by factor
   - Output: New amounts
   - Example: 700g water × 2.0 = 1400g water

5. **Adjust Yeast (If Needed)**
   - Input: Scaled yeast amount
   - Action: Consider production time
   - Output: Adjusted yeast
   - Example: Reduce slightly for large batches

6. **Validate Scaled Formula**
   - Input: Scaled formula
   - Action: Check percentages still match
   - Output: Validation
   - Example: ✅ Hydration still 70%

**Success Criteria:**
- All ingredients scaled proportionally
- Baker's percentages unchanged
- Amounts are practical

**Error Handling:**
- If scaled amount too small (< 1g), warn
- If very large scale (>10x), suggest yeast adjustment

---

## Data Validation Rules

### Validation 1: Flour Percentage

**Field:** Total flour percentage

**Rules:**
- Must equal exactly 100%
- Each flour type > 0%
- All flour types sum to 100%

**Error Messages:**
- Flour ≠ 100% → "Total flour must equal 100%. Currently: [X]%"
- Flour type = 0% → "Flour amount must be greater than 0%"

**Example:**
- ✅ Valid: Bread flour 80% + Whole wheat 20% = 100%
- ❌ Invalid: Bread flour 80% + Whole wheat 15% = 95% → "Total flour must equal 100%. Currently: 95%"

---

### Validation 2: Hydration

**Field:** Water percentage (hydration)

**Rules:**
- Must be > 0%
- Typical range: 50-90%
- Warn if < 50% or > 90%

**Error Messages:**
- Water = 0% → "Water is required"
- Water < 50% → "⚠️ Low hydration (< 50%). Is this intentional?"
- Water > 90% → "⚠️ Very high hydration (> 90%). Dough will be extremely wet."

**Example:**
- ✅ Valid: 70% - No warnings
- ⚠️ Warning: 45% - "Low hydration warning"

---

### Validation 3: Salt

**Field:** Salt percentage

**Rules:**
- Typical range: 1.8-2.2%
- Warn if < 1.5% or > 2.5%

**Error Messages:**
- Salt < 1.5% → "⚠️ Low salt (< 1.5%). Bread may lack flavor."
- Salt > 2.5% → "⚠️ High salt (> 2.5%). Bread may be too salty."

**Example:**
- ✅ Valid: 2.0%
- ⚠️ Warning: 3.0% - "High salt warning"

---

### Validation 4: Preferment

**Field:** Preferment percentage

**Rules:**
- If used: typically 10-30% of flour
- Must specify hydration
- Warn if > 40%

**Error Messages:**
- Preferment > 40% → "⚠️ Large preferment (> 40%). Consider reducing."
- Preferment without hydration → "Preferment hydration required"

**Example:**
- ✅ Valid: 20% poolish at 100% hydration
- ⚠️ Warning: 50% preferment - "Large preferment warning"

---

## Domain Constraints

### Constraint 1: Flour as Baseline

**Constraint:** All baker's percentages must use total flour weight as the baseline (100%)

**Applies To:** All formulas, all calculations

**Rationale:** This is the fundamental principle of baker's percentages

**Enforcement:** Validate flour = 100% on formula save/edit

---

### Constraint 2: Ingredient Relationships

**Constraint:** Preferment flour is part of total flour, not additional

**Applies To:** Formulas with preferments

**Rationale:** Prevents double-counting flour

**Enforcement:** When calculating total flour, include preferment flour in the 100%

---

### Constraint 3: Positive Values Only

**Constraint:** All ingredient amounts must be positive (> 0)

**Applies To:** All ingredients

**Rationale:** Negative or zero amounts are meaningless

**Enforcement:** Validate amount > 0 on input

---

## Domain Standards

### Standard 1: Decimal Precision

**Standard:** Baker's percentages rounded to 1 decimal place

**Reasoning:** More precision is unnecessary and clutters UI

**Implementation:** Always round to 0.1% (e.g., 70.5%, not 70.523%)

**Example:**
- Input: 70.523%
- Display: 70.5%

---

### Standard 2: Weight Units

**Standard:** All weights in grams

**Reasoning:** Grams are more precise than ounces for baking

**Implementation:** Store and display weights in grams only

**Example:**
- ✅ Store: 1000g
- ❌ Don't store: 35.27oz

---

### Standard 3: Temperature Units

**Standard:** Temperatures in Fahrenheit (can add Celsius option later)

**Reasoning:** US bakeries primarily use Fahrenheit

**Implementation:** Display temperatures in °F

**Example:**
- Dough temperature: 75°F
- Oven temperature: 450°F

---

## Notes

- This domain knowledge is specific to professional baking
- Baker's percentages are the universal language of professional bakers
- Always validate flour = 100%
- Hydration percentage is critical for dough consistency
- Preferments add complexity and flavor
- Update this file when domain rules change
- Run `/prime` after updates to reload domain knowledge
