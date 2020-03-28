<%
Dim ConnString

ConnString="Provider=SQLOLEDB.1;Password=pLk2IBWaTh0EVhju1aGxg;Persist Security Info=True;User ID=conn_asp_enquete;Initial Catalog=enquete;Data Source=172.20.2.23"

    
    ' Ouverture de la connexion à la base de données (permanente durant la session)
    If session ("Connexion")&"" = "" Then 
		Dim ConnObj
		Set ConnObj = CreateObject("ADODB.Connection")
 		ConnObj.Open = ConnString
		Set session("Connexion") = ConnObj
	End If


%>
