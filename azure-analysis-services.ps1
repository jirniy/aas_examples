###############################################
#https://docs.microsoft.com/en-us/bi-reference/tmsl/createorreplace-command-tmsl
#Analysis Services supports ASSL and TMSL scripting languages. 
#Only tabular models created at the 1200 compatibility level or higher are described in TMS in JSON format.
#TSML support SQL 2016,SQL 2017 and Azure Analysis Services only (Tabular 1200,Tabular 1400)
#https://docs.microsoft.com/en-us/bi-reference/tmsl/tabular-model-scripting-language-tmsl-reference 
################################################

#if module not installed run Install-module first
#Install-module -AllowClobber -Name SqlServer

#deploy azure tabular olap cube from json file 
Invoke-ASCmd -InputFile "C:\my_cube_tsml.json" -Server "asazure://westus.asazure.windows.net/my_cube"

#execute xmla command from file to azure tabular olap cube 
Invoke-ASCmd -InputFile "C:\cube-sourcedb-connection.xmla" -Server "asazure://westus.asazure.windows.net/my_cube"

#process azure tabular olap cube from powershell 
Invoke-ProcessASDatabase -Server "asazure://westus.asazure.windows.net/my_cube" -DatabaseName "testcube"  -RefreshType "Full"

