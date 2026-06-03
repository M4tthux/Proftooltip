# ProfTooltip — Engineering DB verification report

**Date:** 2026-06-03  
**File checked:** `ProfTooltip/db/recipes_engineering.lua` (251 recipes)  
**Reference:** Wowhead Classic (`fr.wowhead.com/classic/spell=…`), via the engineering-scanner `recipes.json` scrape (161 vanilla recipes from AtlasLootClassic_Crafting), spot-confirmed live on Wowhead for Iron Grenade, Force Reactive Disk, Goblin Sapper Charge, and Fel Iron Bomb.

## Summary

| Issue | Count |
|---|---|
| Recipes out of scope (TBC/WotLK, not in Classic Era 1.15) | 88 |
| Vanilla recipes with wrong reagents/quantities | 36 |
| Vanilla recipes verified correct | 122 |
| Legit vanilla extras kept (not in AtlasLoot list) | 3 (Arclight Spanner 6219, Fused Wiring 7191, Goblin Mortar 10577) |

> Note: the file header says "Source: wow-classic-items npm" but the data clearly includes multiple expansions — root cause of both problem categories.

---

## A. 36 reagent / quantity mismatches (addon -> Wowhead Classic)

```
### 36 REAGENT MISMATCHES

1. [4390] Iron Grenade
     - Iron Bar: addon 3 -> Wowhead 1
     - Heavy Blasting Powder: addon 2 -> Wowhead 1

2. [4394] Big Iron Bomb
     - Silk Cloth: addon 1 -> Wowhead 0
     - Poudre d'explosion majeure: addon 0 -> Wowhead 3
     - Iron Strut: addon 1 -> Wowhead 0
     - Contact en argent: addon 0 -> Wowhead 1
     - Solid Blasting Powder: addon 2 -> Wowhead 0

3. [4395] Goblin Land Mine
     - Poudre d'explosion majeure: addon 0 -> Wowhead 3
     - Gyrochronatome: addon 0 -> Wowhead 1
     - Solid Blasting Powder: addon 4 -> Wowhead 0

4. [4396] Mechanical Dragonling
     - Citrine: addon 1 -> Wowhead 2
     - Iron Strut: addon 2 -> Wowhead 4
     - Gyrochronatom: addon 2 -> Wowhead 4
     - Câble avec fusible: addon 0 -> Wowhead 1

5. [7189] Goblin Rocket Boots
     - Mithril Bar: addon 4 -> Wowhead 0
     - Cuir lourd: addon 0 -> Wowhead 4
     - Mageweave Cloth: addon 4 -> Wowhead 0
     - Carburant de fusée des gobelins: addon 0 -> Wowhead 2
     - Bottes noires en tisse-mage: addon 0 -> Wowhead 1
     - Tube en mithril: addon 0 -> Wowhead 2
     - Unstable Trigger: addon 2 -> Wowhead 1
     - Mithril Casing: addon 2 -> Wowhead 0

6. [10548] Sniper Scope
     - Barre de vrai-argent: addon 0 -> Wowhead 2
     - Rubis étoilé: addon 0 -> Wowhead 1
     - Tube en mithril: addon 0 -> Wowhead 1
     - Arcanite Bar: addon 1 -> Wowhead 0
     - Thorium Widget: addon 2 -> Wowhead 0

7. [10562] Hi-Explosive Bomb
     - Solid Blasting Powder: addon 1 -> Wowhead 2

8. [10576] Mithril Mechanical Dragonling
     - Mithril Bar: addon 4 -> Wowhead 14
     - Heart of Fire: addon 2 -> Wowhead 4
     - Star Ruby: addon 1 -> Wowhead 2
     - Cylindre damasquiné en mithril: addon 0 -> Wowhead 2
     - Carburant de fusée des gobelins: addon 0 -> Wowhead 2

9. [10586] The Big One
     - Carburant de fusée des gobelins: addon 0 -> Wowhead 1
     - Solid Blasting Powder: addon 10 -> Wowhead 0
     - Dynamite solide: addon 0 -> Wowhead 6
     - Unstable Trigger: addon 6 -> Wowhead 1
     - Mithril Casing: addon 10 -> Wowhead 1

10. [10587] Goblin Bomb Dispenser
     - Lunette de précision: addon 0 -> Wowhead 2
     - Barre de vrai-argent: addon 0 -> Wowhead 6
     - Solid Blasting Powder: addon 6 -> Wowhead 4
     - Unstable Trigger: addon 4 -> Wowhead 1
     - Mithril Casing: addon 6 -> Wowhead 2

11. [10645] Gnomish Death Ray
     - Mithril Bar: addon 8 -> Wowhead 0
     - Mageweave Cloth: addon 4 -> Wowhead 0
     - Ichor de non-mort: addon 0 -> Wowhead 4
     - Cylindre damasquiné en mithril: addon 0 -> Wowhead 1
     - Gyromatic Micro-Adjustor: addon 1 -> Wowhead 0
     - Mithril Tube: addon 6 -> Wowhead 2
     - Déclencheur instable: addon 0 -> Wowhead 1
     - Essence de non-mort: addon 0 -> Wowhead 1

12. [10646] Goblin Sapper Charge
     - Etoffe de tisse-mage: addon 0 -> Wowhead 1
     - Solid Blasting Powder: addon 2 -> Wowhead 3
     - Déclencheur instable: addon 0 -> Wowhead 1
     - Mithril Casing: addon 2 -> Wowhead 0

13. [10716] Gnomish Shrink Ray
     - Jade: addon 0 -> Wowhead 2
     - Flacon de mojo: addon 0 -> Wowhead 4
     - Gyromatic Micro-Adjustor: addon 1 -> Wowhead 0
     - Mithril Tube: addon 4 -> Wowhead 1
     - Unstable Trigger: addon 2 -> Wowhead 1

14. [10720] Gnomish Net-o-Matic Projector
     - Mithril Bar: addon 8 -> Wowhead 4
     - Soie d'araignée épaisse: addon 0 -> Wowhead 4
     - Soie des ténèbres: addon 0 -> Wowhead 2
     - Gyromatic Micro-Adjustor: addon 1 -> Wowhead 0
     - Poudre noire solide: addon 0 -> Wowhead 2
     - Tube en mithril: addon 0 -> Wowhead 1
     - Unstable Trigger: addon 4 -> Wowhead 0
     - Mithril Casing: addon 4 -> Wowhead 0

15. [10721] Gnomish Harm Prevention Belt
     - Barre de mithril: addon 0 -> Wowhead 4
     - Mageweave Cloth: addon 8 -> Wowhead 0
     - Barre de vrai-argent: addon 0 -> Wowhead 2
     - Ceinture matte: addon 0 -> Wowhead 1
     - Aigue-marine: addon 0 -> Wowhead 2
     - Gyromatic Micro-Adjustor: addon 1 -> Wowhead 0
     - Mithril Tube: addon 4 -> Wowhead 0
     - Unstable Trigger: addon 4 -> Wowhead 1

16. [10724] Gnomish Rocket Boots
     - Mithril Bar: addon 4 -> Wowhead 0
     - Cuir lourd: addon 0 -> Wowhead 4
     - Mageweave Cloth: addon 4 -> Wowhead 0
     - Gyrochronatome: addon 0 -> Wowhead 4
     - Bottes noires en tisse-mage: addon 0 -> Wowhead 1
     - Gyromatic Micro-Adjustor: addon 1 -> Wowhead 0
     - Poudre noire solide: addon 0 -> Wowhead 8
     - Tube en mithril: addon 0 -> Wowhead 2
     - Unstable Trigger: addon 2 -> Wowhead 0

17. [10725] Gnomish Battle Chicken
     - Jade: addon 0 -> Wowhead 2
     - Mithril Bar: addon 30 -> Wowhead 6
     - Mageweave Cloth: addon 12 -> Wowhead 0
     - Barre de vrai-argent: addon 0 -> Wowhead 6
     - Cylindre damasquiné en mithril: addon 0 -> Wowhead 2
     - Solid Blasting Powder: addon 6 -> Wowhead 0
     - Batterie en or: addon 0 -> Wowhead 1
     - Unstable Trigger: addon 6 -> Wowhead 0
     - Caisse en mithril: addon 0 -> Wowhead 1

18. [10726] Gnomish Mind Control Cap
     - Mithril Bar: addon 6 -> Wowhead 10
     - Barre de vrai-argent: addon 0 -> Wowhead 4
     - Rubis étoilé: addon 0 -> Wowhead 2
     - Gyromatic Micro-Adjustor: addon 1 -> Wowhead 0
     - Batterie en or: addon 0 -> Wowhead 1
     - Mithril Tube: addon 2 -> Wowhead 0

19. [10727] Goblin Dragon Gun
     - Barre de mithril: addon 0 -> Wowhead 6
     - Barre de vrai-argent: addon 0 -> Wowhead 6
     - Elemental Fire: addon 1 -> Wowhead 0
     - Carburant de fusée des gobelins: addon 0 -> Wowhead 4
     - Tube en mithril: addon 0 -> Wowhead 2
     - Unstable Trigger: addon 4 -> Wowhead 1
     - Mithril Casing: addon 4 -> Wowhead 0

20. [15846] Salt Shaker
     - Gold Power Core: addon 3 -> Wowhead 1
     - Déclencheur instable: addon 0 -> Wowhead 4

21. [16022] Arcanite Dragonling
     - Batterie en or: addon 0 -> Wowhead 4
     - Petit dragon mécanique en mithril: addon 0 -> Wowhead 1
     - Arcanite Bar: addon 6 -> Wowhead 0
     - Barre de thorium enchanté: addon 0 -> Wowhead 10
     - Cuir enchanté: addon 0 -> Wowhead 6
     - Runecloth: addon 10 -> Wowhead 0
     - Thorium Widget: addon 4 -> Wowhead 6
     - Convertisseur d'arcanite délicat: addon 0 -> Wowhead 8

22. [18168] Force Reactive Disk
     - Essence de terre: addon 0 -> Wowhead 8
     - Essence d'air: addon 0 -> Wowhead 8
     - Arcanite Bar: addon 10 -> Wowhead 6
     - Essence de vie: addon 0 -> Wowhead 12
     - Dense Blasting Powder: addon 4 -> Wowhead 0
     - Thorium Widget: addon 8 -> Wowhead 0
     - Convertisseur d'arcanite délicat: addon 0 -> Wowhead 2

23. [18232] Field Repair Bot 74A
     - Terre élémentaire: addon 0 -> Wowhead 2
     - Feu élémentaire: addon 0 -> Wowhead 1
     - Câble avec fusible: addon 0 -> Wowhead 1
     - Cuir robuste: addon 0 -> Wowhead 4
     - Dream Dust: addon 2 -> Wowhead 0
     - Barre de thorium: addon 0 -> Wowhead 12
     - Runecloth: addon 4 -> Wowhead 0
     - Thorium Widget: addon 8 -> Wowhead 0

24. [18282] Core Marksman Rifle
     - Arcanite Bar: addon 4 -> Wowhead 6
     - Thorium Widget: addon 4 -> Wowhead 0
     - Thorium Tube: addon 4 -> Wowhead 2
     - Convertisseur d'arcanite délicat: addon 0 -> Wowhead 2
     - item 17010: addon 0 -> Wowhead 4
     - item 17011: addon 0 -> Wowhead 2

25. [18587] Goblin Jumper Cables XL
     - Câble avec fusible: addon 0 -> Wowhead 2
     - Rubis étoilé: addon 0 -> Wowhead 2
     - Arcanite Bar: addon 1 -> Wowhead 0
     - Runecloth: addon 4 -> Wowhead 0
     - Soie d'araignée toilacier: addon 0 -> Wowhead 2
     - item 18631: addon 0 -> Wowhead 2

26. [18634] Gyrofreeze Ice Reflector
     - Huile glaciale: addon 0 -> Wowhead 2
     - Elemental Water: addon 1 -> Wowhead 0
     - Essence de feu: addon 0 -> Wowhead 4
     - Arcanite Bar: addon 1 -> Wowhead 0
     - Saphir bleu: addon 0 -> Wowhead 2
     - Calot de glace: addon 0 -> Wowhead 4
     - Thorium Widget: addon 1 -> Wowhead 6
     - item 18631: addon 0 -> Wowhead 2

27. [18638] Hyper-Radiant Flame Reflector
     - Elemental Fire: addon 1 -> Wowhead 0
     - Essence d'eau: addon 0 -> Wowhead 6
     - Rubis étoilé: addon 0 -> Wowhead 4
     - Barre de sombrefer: addon 0 -> Wowhead 4
     - Arcanite Bar: addon 1 -> Wowhead 0
     - Diamant d'Azeroth: addon 0 -> Wowhead 2
     - Thorium Widget: addon 1 -> Wowhead 0
     - item 18631: addon 0 -> Wowhead 3

28. [18639] Ultra-Flash Shadow Reflector
     - Elemental Air: addon 1 -> Wowhead 0
     - Barre de sombrefer: addon 0 -> Wowhead 8
     - Arcanite Bar: addon 1 -> Wowhead 0
     - Grande opale: addon 0 -> Wowhead 2
     - Diamant d'Azeroth: addon 0 -> Wowhead 2
     - Essence de vie: addon 0 -> Wowhead 6
     - Essence de non-mort: addon 0 -> Wowhead 4
     - Thorium Widget: addon 1 -> Wowhead 0
     - item 18631: addon 0 -> Wowhead 4

29. [18641] Dense Dynamite
     - Runecloth: addon 1 -> Wowhead 3

30. [18645] Gnomish Alarm-o-Bot
     - Rubis étoilé: addon 0 -> Wowhead 1
     - Cuir robuste: addon 0 -> Wowhead 4
     - Rouage en thorium: addon 0 -> Wowhead 2

31. [18984] Dimensional Ripper - Everlook
     - Barre de mithril: addon 0 -> Wowhead 10
     - Elemental Fire: addon 2 -> Wowhead 0
     - Coeur de feu: addon 0 -> Wowhead 4
     - Rubis étoilé: addon 0 -> Wowhead 2
     - Le Mastoc: addon 0 -> Wowhead 1
     - Arcanite Bar: addon 1 -> Wowhead 0
     - Thorium Widget: addon 2 -> Wowhead 0
     - Thorium Tube: addon 2 -> Wowhead 0
     - item 18631: addon 0 -> Wowhead 1

32. [18986] Ultrasafe Transporter: Gadgetzan
     - Barre de mithril: addon 0 -> Wowhead 12
     - Elemental Water: addon 2 -> Wowhead 0
     - Noyau de terre: addon 0 -> Wowhead 4
     - Globe d'eau: addon 0 -> Wowhead 2
     - Aigue-marine: addon 0 -> Wowhead 4
     - Cylindre damasquiné en mithril: addon 0 -> Wowhead 1
     - Arcanite Bar: addon 1 -> Wowhead 0
     - Thorium Widget: addon 2 -> Wowhead 0
     - Thorium Tube: addon 2 -> Wowhead 0
     - item 18631: addon 0 -> Wowhead 2

33. [19998] Bloodvine Lens
     - Azerothian Diamond: addon 1 -> Wowhead 0
     - Powerful Mojo: addon 6 -> Wowhead 8
     - Cuir enchanté: addon 0 -> Wowhead 4
     - Convertisseur d'arcanite délicat: addon 0 -> Wowhead 1
     - Bloodvine: addon 6 -> Wowhead 5
     - Âmarite: addon 0 -> Wowhead 5

34. [19999] Bloodvine Goggles
     - Star Ruby: addon 2 -> Wowhead 0
     - Powerful Mojo: addon 6 -> Wowhead 8
     - Convertisseur d'arcanite délicat: addon 0 -> Wowhead 2
     - Âmarite: addon 0 -> Wowhead 5

35. [21570] Cluster Launcher
     - Cylindre damasquiné en mithril: addon 0 -> Wowhead 4
     - Goblin Rocket Fuel: addon 1 -> Wowhead 4
     - item 18631: addon 0 -> Wowhead 2

36. [22728] Steam Tonk Controller
     - Mithril Bar: addon 3 -> Wowhead 0
     - Caisse en mithril: addon 0 -> Wowhead 1
     - Rouage en thorium: addon 0 -> Wowhead 2

```

---

## B. 88 recipes to remove (TBC / WotLK — do not exist in Classic Era 1.15)

```
[20475] Adamantite Arrow Maker  (TBC)
[23736] Fel Iron Bomb  (TBC)
[23737] Adamantite Grenade  (TBC)
[23742] Fel Iron Musket  (TBC)
[23746] Adamantite Rifle  (TBC)
[23747] Felsteel Boomstick  (TBC)
[23748] Ornate Khorium Rifle  (TBC)
[23758] Cogspinner Goggles  (TBC)
[23761] Power Amplification Goggles  (TBC)
[23762] Ultra-Spectropic Detection Goggles  (TBC)
[23763] Hyper-Vision Goggles  (TBC)
[23764] Adamantite Scope  (TBC)
[23765] Khorium Scope  (TBC)
[23766] Stabilized Eternium Scope  (TBC)
[23767] Crashin' Thrashin' Robot  (TBC)
[23768] White Smoke Flare  (TBC)
[23771] Green Smoke Flare  (TBC)
[23772] Fel Iron Shells  (TBC)
[23774] Fel Iron Toolbox  (TBC)
[23775] Titanium Toolbox  (TBC)
[23781] Elemental Blasting Powder  (TBC)
[23782] Fel Iron Casing  (TBC)
[23783] Handful of Fel Iron Bolts  (TBC)
[23784] Adamantite Frame  (TBC)
[23785] Hardened Adamantite Tube  (TBC)
[23786] Khorium Power Core  (TBC)
[23787] Felsteel Stabilizer  (TBC)
[23819] Elemental Seaforium Charge  (TBC)
[23821] Zapthrottle Mote Extractor  (TBC)
[23824] Rocket Boots Xtreme  (TBC)
[23825] Nigh Invulnerability Belt  (TBC)
[23826] The Bigger One  (TBC)
[23827] Super Sapper Charge  (TBC)
[23828] Gnomish Power Goggles  (TBC)
[23829] Gnomish Battle Goggles  (TBC)
[23835] Gnomish Poultryizer  (TBC)
[23836] Goblin Rocket Launcher  (TBC)
[23838] Foreman's Enchanted Helmet  (TBC)
[23839] Foreman's Reinforced Helmet  (TBC)
[23841] Gnomish Flame Turret  (TBC)
[25886] Purple Smoke Flare  (TBC)
[30542] Dimensional Ripper - Area 52  (TBC)
[30544] Ultrasafe Transporter: Toshley's Station  (TBC)
[32413] Frost Grenade  (TBC)
[32423] Icy Blasting Primers  (TBC)
[32756] Gyro-Balanced Khorium Destroyer  (TBC)
[33092] Healing Potion Injector  (TBC)
[33093] Mana Potion Injector  (TBC)
[34060] Flying Machine Control  (TBC)
[34061] Turbo-Charged Flying Machine Control  (TBC)
[34113] Field Repair Bot 110G  (TBC)
[34504] Adamantite Shell Machine  (TBC)
[35581] Rocket Boots Xtreme Lite  (TBC)
[37567] Healing Injector Kit  (TBC)
[39681] Handful of Cobalt Bolts  (WotLK)
[39682] Overcharged Capacitor  (WotLK)
[39683] Froststeel Tube  (WotLK)
[39688] Mark   (WotLK)
[39690] Volatile Blasting Trigger  (WotLK)
[40536] Explosive Decoy  (WotLK)
[40767] Sonic Booster  (WotLK)
[40768] MOLL-E  (WotLK)
[40769] Scrapbot Construction Kit  (WotLK)
[40771] Cobalt Frag Bomb  (WotLK)
[40772] Gnomish Army Knife  (WotLK)
[40865] Noise Machine  (WotLK)
[40892] Hammer Pick  (WotLK)
[40893] Bladed Pickaxe  (WotLK)
[40895] Gnomish X-Ray Specs  (WotLK)
[41121] Gnomish Lightning Generator  (WotLK)
[41146] Sun Scope  (WotLK)
[41164] Mammoth Cutters  (WotLK)
[41165] Saronite Razorheads  (WotLK)
[41167] Heartseeker Scope  (WotLK)
[41168] Armor Plated Combat Shotgun  (WotLK)
[41508] Mechano-hog  (WotLK)
[42546] Mana Injector Kit  (WotLK)
[42641] Global Thermal Sapper Charge  (WotLK)
[44413] Mekgineer's Chopper  (WotLK)
[44504] Nesingwary 4000  (WotLK)
[44739] Diamond-cut Refractor Scope  (WotLK)
[44951] Box of Bombs  (WotLK)
[45631] High-powered Flashlight  (WotLK)
[47828] Goblin Beam Welder  (WotLK)
[48933] Wormhole Generator: Northrend  (WotLK)
[49040] Jeeves  (WotLK)
[52020] Shatter Rounds  (WotLK)
[52021] Iceblade Arrow  (WotLK)
```
