-- ============================================================
-- REFACTORED POKÉMON DASHBOARD SQL QUERIES
-- ============================================================

-- ============================================================
-- BATTLE STATISTICS QUERIES (Dim_btl)
-- ============================================================

-- 1) Pokémon Attack Distribution
SELECT
    b.atk AS attack_value,
    COUNT(*) AS quantity
FROM dw.Fat_pokdx f
INNER JOIN dw.Dim_btl b ON b.SRK_btl = f.SRK_btl
GROUP BY b.atk
ORDER BY b.atk;

-- 2) Pokémon Defense Distribution
SELECT
    b.dfs AS defense_value,
    COUNT(*) AS quantity
FROM dw.Fat_pokdx f
INNER JOIN dw.Dim_btl b ON b.SRK_btl = f.SRK_btl
GROUP BY b.dfs
ORDER BY b.dfs;

-- 3) Capture Rate Distribution
SELECT
    b.cap_rte AS capture_rate,
    COUNT(*) AS quantity
FROM dw.Fat_pokdx f
INNER JOIN dw.Dim_btl b ON b.SRK_btl = f.SRK_btl
GROUP BY b.cap_rte
ORDER BY b.cap_rte;

-- ============================================================
-- POKÉMON CLASSIFICATION QUERIES (Dim_pkm)
-- ============================================================

-- 4) Pokémon Count by Primary Type
SELECT
    p.tp1 AS primary_type,
    COUNT(*) AS quantity
FROM dw.Fat_pokdx f
INNER JOIN dw.Dim_pkm p ON p.SRK_pkn = f.SRK_pkn
GROUP BY p.tp1
ORDER BY quantity DESC;

-- 5) Pokémon Count by Generation
SELECT
    p.gen AS generation,
    COUNT(*) AS quantity
FROM dw.Fat_pokdx f
INNER JOIN dw.Dim_pkm p ON p.SRK_pkn = f.SRK_pkn
GROUP BY p.gen
ORDER BY p.gen;

-- 6) Legendary Pokémon Count by Primary Type
SELECT
    p.tp1 AS primary_type,
    COUNT(*) AS quantity
FROM dw.Dim_pkm p
INNER JOIN dw.Fat_pokdx f ON f.SRK_pkn = p.SRK_pkn
WHERE p.leg = TRUE
GROUP BY p.tp1
ORDER BY quantity DESC;

-- 7) Pokémon with Alolan Forms
SELECT
    CASE
        WHEN p.all_frm = TRUE THEN 'Has Alolan Form'
        ELSE 'No Alolan Form'
    END AS alolan_form_status,
    COUNT(*) AS quantity
FROM dw.Dim_pkm p
INNER JOIN dw.Fat_pokdx f ON f.SRK_pkn = p.SRK_pkn
GROUP BY p.all_frm
ORDER BY p.all_frm;

-- 8) Pokémon with Galarian Forms
SELECT
    CASE
        WHEN p.glr_frm = TRUE THEN 'Has Galarian Form'
        ELSE 'No Galarian Form'
    END AS galarian_form_status,
    COUNT(*) AS quantity
FROM dw.Dim_pkm p
INNER JOIN dw.Fat_pokdx f ON f.SRK_pkn = p.SRK_pkn
GROUP BY p.glr_frm
ORDER BY p.glr_frm;

-- ============================================================
-- TYPE EFFECTIVENESS QUERIES (Dim_efetContr)
-- ============================================================

-- 9) Average Effectiveness Against Normal Type
SELECT
    ROUND(AVG(e.agt_nrm)::numeric, 2) AS avg_effectiveness_normal
FROM dw.Fat_pokdx f
INNER JOIN dw.Dim_efetContr e ON e.SRK_eft = f.SRK_eft;

-- 10) Average Effectiveness Against Fighting Type
SELECT
    ROUND(AVG(e.agt_fgt)::numeric, 2) AS avg_effectiveness_fighting
FROM dw.Fat_pokdx f
INNER JOIN dw.Dim_efetContr e ON e.SRK_eft = f.SRK_eft;

-- 11) Average Effectiveness Against Rock Type
SELECT
    ROUND(AVG(e.agt_rck)::numeric, 2) AS avg_effectiveness_rock
FROM dw.Fat_pokdx f
INNER JOIN dw.Dim_efetContr e ON e.SRK_eft = f.SRK_eft;

-- 12) Average Effectiveness Against Dragon Type
SELECT
    ROUND(AVG(e.agt_drg)::numeric, 2) AS avg_effectiveness_dragon
FROM dw.Fat_pokdx f
INNER JOIN dw.Dim_efetContr e ON e.SRK_eft = f.SRK_eft;

-- ============================================================
-- COMBINED EFFECTIVENESS STATISTICS
-- ============================================================

-- 13) Normal Type Effectiveness Statistics
SELECT
    ROUND(AVG(e.agt_nrm)::numeric, 2) AS avg_effectiveness_normal,
    ROUND(MAX(e.agt_nrm)::numeric, 2) AS max_effectiveness_normal
FROM dw.Fat_pokdx f
INNER JOIN dw.Dim_efetContr e ON e.SRK_eft = f.SRK_eft;

-- 14) Fighting Type Effectiveness Statistics
SELECT
    ROUND(AVG(e.agt_fgt)::numeric, 2) AS avg_effectiveness_fighting,
    ROUND(MAX(e.agt_fgt)::numeric, 2) AS max_effectiveness_fighting
FROM dw.Fat_pokdx f
INNER JOIN dw.Dim_efetContr e ON e.SRK_eft = f.SRK_eft;

-- 15) Rock Type Effectiveness Statistics
SELECT
    ROUND(AVG(e.agt_rck)::numeric, 2) AS avg_effectiveness_rock,
    ROUND(MAX(e.agt_rck)::numeric, 2) AS max_effectiveness_rock
FROM dw.Fat_pokdx f
INNER JOIN dw.Dim_efetContr e ON e.SRK_eft = f.SRK_eft;

-- ============================================================
-- ENHANCED QUERIES FOR BETTER DASHBOARD VISUALIZATION
-- ============================================================



-- 17) Pokémon Type Combinations
SELECT
    p.tp1 AS primary_type,
    'None' AS secondary_type,
    COUNT(*) AS quantity
FROM dw.Fat_pokdx f
INNER JOIN dw.Dim_pkm p ON p.SRK_pkn = f.SRK_pkn
GROUP BY p.tp1
ORDER BY quantity DESC;


-- 18) Legendary Pokémon Statistics
SELECT
    COUNT(*) AS total_legendary,
    ROUND(AVG(b.atk), 2)::numeric AS avg_attack_legendary,
    ROUND(AVG(b.dfs), 2)::numeric AS avg_defense_legendary
FROM dw.Fat_pokdx f
INNER JOIN dw.Dim_btl b ON b.SRK_btl = f.SRK_btl
INNER JOIN dw.Dim_pkm p ON p.SRK_pkn = f.SRK_pkn
WHERE p.leg = TRUE;

-- ============================================================
-- END OF REFACTORED QUERIES
-- ============================================================