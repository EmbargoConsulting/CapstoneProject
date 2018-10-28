SELECT datename(month, program.datetime) as 'Month', COUNT(CASE WHEN OnOffSite=1 THEN 1 END) as 'On-Site', Count(Case when LiveProgram.OnOffSite=0 then 1 end) as 'Off-Site', Count(*) as 'Total Programs', SUM(Program.ChildAttendance) as 'Children', SUM(Program.AdultAttendance) 'Adults', SUM(Program.AdultAttendance) + SUM(Program.ChildAttendance) as 'Total People' 
FROM            LiveProgram INNER JOIN
                         Program ON LiveProgram.ProgramID = Program.ProgramID
						 GROUP BY datename(month, program.datetime)