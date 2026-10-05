USE kathu_college_stg;
GO

-- Create and load the Grade 10 bronze table.
IF NOT EXISTS (
    SELECT 1
    FROM sys.tables
    WHERE name = N'prelim_science_students_marks_g10'
      AND schema_id = SCHEMA_ID(N'bronze')
)
BEGIN
    SELECT
        student_id,
        student_name,
        grade,
        mathematics_mark,
        physical_science_mark,
        life_sciences_mark,
        english_home_language_mark,
        life_orientation_mark,
        information_technology_mark,
        agricultural_science_mark,
        total_mark,
        average_mark
    INTO [kathu_college_stg].[bronze].[prelim_science_students_marks_g10]
    FROM [kathu_college_stg].[bronze].[prelim_science_students_marks]
    WHERE grade IN ('10A', '10B');
END;
GO

-- Create and load the Grade 11 bronze table.
IF NOT EXISTS (
    SELECT 1
    FROM sys.tables
    WHERE name = N'prelim_science_students_marks_g11'
      AND schema_id = SCHEMA_ID(N'bronze')
)
BEGIN
    SELECT
        student_id,
        student_name,
        grade,
        mathematics_mark,
        physical_science_mark,
        life_sciences_mark,
        english_home_language_mark,
        life_orientation_mark,
        information_technology_mark,
        agricultural_science_mark,
        total_mark,
        average_mark
    INTO [kathu_college_stg].[bronze].[prelim_science_students_marks_g11]
    FROM [kathu_college_stg].[bronze].[prelim_science_students_marks]
    WHERE grade IN ('11A', '11B');
END;
GO

-- Create and load the Grade 12 bronze table.
IF NOT EXISTS (
    SELECT 1
    FROM sys.tables
    WHERE name = N'prelim_science_students_marks_g12'
      AND schema_id = SCHEMA_ID(N'bronze')
)
BEGIN
    SELECT
        student_id,
        student_name,
        grade,
        mathematics_mark,
        physical_science_mark,
        life_sciences_mark,
        english_home_language_mark,
        life_orientation_mark,
        information_technology_mark,
        agricultural_science_mark,
        total_mark,
        average_mark
    INTO [kathu_college_stg].[bronze].[prelim_science_students_marks_g12]
    FROM [kathu_college_stg].[bronze].[prelim_science_students_marks]
    WHERE grade IN ('12A', '12B');
END;
GO

-- Check the number of students loaded into each table.
SELECT 'Grade 10' AS grade_group, COUNT(*) AS student_count
FROM [kathu_college_stg].[bronze].[prelim_science_students_marks_g10]

UNION ALL

SELECT 'Grade 11', COUNT(*)
FROM [kathu_college_stg].[bronze].[prelim_science_students_marks_g11]
UNION ALL

SELECT 'Grade 12', COUNT(*)
FROM [kathu_college_stg].[bronze].[prelim_science_students_marks_g12];
GO