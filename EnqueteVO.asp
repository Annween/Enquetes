<% option explicit %>
<!--#include file="./includes/connectBase.asp"-->

<%
'Récupération des ID

'response.write(Request.QueryString("id"))

dim cmd,rs, cle
set cmd=Server.CreateObject("ADODB.Command")
cmd.ActiveConnection=Session("Connexion")
cmd.CommandType=4
cmd.CommandText="dbo.proc_admin"
set rs=cmd.Execute (array,(Request.QueryString("id")))

set cmd=Nothing

%>
<!DOCTYPE HTML>
<html lang="fr">
<head>
 
	<title>Espace Enquete</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="./css/style_menuVO.css">
   

	<script src="./includes/jquery-2.1.4.min.js" type="text/javascript"></script>
	<script src="./includes/scripts.js" type="text/javascript"></script>
	<script src="./includes/menuVO.js" type="text/javascript"></script>
	<script src="./includes/opacity.js" type="text/javascript"></script>
	  <!-- Bootstrap CSS CDN -->
    <link rel="stylesheet" href="./css/bootstrap.min.css" >  <!--    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous"> 	-->
  
        
    <meta name="viewport" content="width=device-width, initial-scale=1"> 

<header id="cadre"><h2>ESPACE ENQUETE</h2></header>
  
  <!--

	<table class="logo">
	 <tr>
	     <td><img src="images/opca.png" alt="logo" /></td><br>
	</tr>
	</table>			
-->	



</head>
<div id="main">

<script>
	

	
	function add_form(){
		
		//CREATION DES ELEMENTS HTML
		  
		var enquete_libelle = document.createElement("input");
		var btt_add_enquete = document.createElement("input");
		var div_enquete = document.createElement("div");
	


		
		//CREATION D ATTRIBUTS
		var classe =  document.createAttribute("class");   
		var id =  document.createAttribute("id"); 
		var placeholder =  document.createAttribute("placeholder");   
		var id_btt_enquete =  document.createAttribute("id"); 
		var value =  document.createAttribute("value"); 
		var div_enquete_id = document.createAttribute("id");   
		var style =  document.createAttribute("style");
		var type = document.createAttribute("type");

		
		
		
		//AFFECTATION D UNE VALEUR AUX ATTRIBUTS
		classe.value = "center_div";
		placeholder.value = "Enquête sans titre";
		id.value = "titre_enquete";
		type.value = "button";
		id_btt_enquete.value = "btt_enquete";
		div_enquete_id.value = "div_enquete";
		value.value = "Valider";
		style.value = "margin: 0 auto; width: 300px; background-color: #E4EFFF;  zindex: 2;  border-collapse: collapse; ";

		
		
		
		
		//INTEGRATION DES ATTRIBUT DANS LES ELEMENTS
		div_enquete.setAttributeNode(style);  
		enquete_libelle.setAttributeNode(id);   
	 
		div_enquete.setAttributeNode(div_enquete_id);  
		enquete_libelle.setAttributeNode(placeholder);   
		btt_add_enquete.setAttributeNode(id_btt_enquete); 
		
		btt_add_enquete.setAttributeNode(type);
		btt_add_enquete.setAttributeNode(value); 

		

		//INTEGRATION DES ELEMENTS DANS LA PAGE
		
		div_enquete.appendChild(enquete_libelle);
		div_enquete.appendChild(btt_add_enquete);
		
		document.body.appendChild(div_enquete);
		btt_add_enquete.onclick = add_enquete;
			
	}
	
function add_enquete()
{
	
		if (document.getElementById("id_enquete") == null)
		{
			cle = document.getElementById("cle").value;
			libelle = document.getElementById("titre_enquete").value;
			
			$.post( "./fct.asp", { fct: "maj_enquete", libelle: libelle, cle: cle, id_enquete: 0, objet: "create"} ) 
			.done(function( data ) 
			{
				$("#retour").html(data);
				
				//CREATION DES ELEMENTS HTML
				var quest = document.createElement("input");
				var btt_add_question = document.createElement("input");
				
				
				
				//CREATION D ATTRIBUTS
				var titre_question =  document.createAttribute("id");   
				var id_btt_question = document.createAttribute("id");
				var name_btt_question = document.createAttribute("name");
				var type =  document.createAttribute("type");   
				var value =  document.createAttribute("value");   
				var placeholder_question = document.createAttribute("placeholder");  
			
						
				//AFFECTATION D UNE VALEUR AUX ATTRIBUTS
				titre_question.value = "titre_question";
				quest.innerHTML = "Question";
				name_btt_question.value = "btt_add_question1";
				id_btt_question.value = "question_0";
				type.value = "button";
				value.value = "Valider";
				placeholder_question.value = "Titre Question";
			   				
				
				//INTEGRATION DES ATTRIBUT DANS LES ELEMENTS
				quest.setAttributeNode(placeholder_question);  
				quest.setAttributeNode(titre_question);  
				btt_add_question.setAttributeNode(value); 
				btt_add_question.setAttributeNode(name_btt_question); 
				btt_add_question.setAttributeNode(id_btt_question);
				btt_add_question.setAttributeNode(type);  

				//INTEGRATION DES ELEMENTS DANS LA PAGE
				div_enquete.appendChild(quest);
				div_enquete.appendChild(btt_add_question);
				btt_add_question.onclick = add_question;

				
			});
			
			
		}
		else 
		{
			//UPDATE CAR INPUT id_enquete EXISTANT 
			cle = document.getElementById("cle").value;
			libelle = document.getElementById("titre_enquete").value;
			id_enquete = document.getElementById("id_enquete").value;
			
			$.post( "./fct.asp", { fct: "maj_enquete", libelle: libelle, cle: cle, id_enquete: id_enquete, objet: "update"} ) 
			
			.done(function( data ) {
				var x = document.getElementById("titre_enquete");
				x.style.backgroundColor = '#ddffdd';
			});
		
		}
		
	}
	function add_question()
	{
		if (this.id == "question_0")
		{
			id_enquete = document.getElementById("id_enquete").value;
			question = document.getElementById("titre_question").value;
			
			
			$.post( "./fct.asp", { fct: "maj_question", question: question, id_enquete: id_enquete, id_question: 0,  objet: "create"} ) 
				.done(function( data ) {
					
					var id_question = data;
					$("#question_0").attr("id","question_"+data);
					
					var div_reponse = document.createElement("div");
						var reponse = document.createElement("input");
						var select = document.createElement("select");
						var option = document.createElement("option");
						var option2 = document.createElement("option");
						var option3 = document.createElement("option");
						var option4 = document.createElement("option");
						var img_add_question = document.createElement("img");
						var img_add_reponse = document.createElement("img");

					
						
						//CREATION D ATTRIBUTS
						var select_id = document.createAttribute("id");
						var id_reponse = document.createAttribute("id");
						var div_reponse_id = document.createAttribute("id");   
						var style_img_add_question =  document.createAttribute("style");  
						var src_img_add_question = document.createAttribute("src");
						var style_img_add_reponse =  document.createAttribute("style");  
						var src_img_add_reponse = document.createAttribute("src");
						var id_img_add_question = document.createAttribute("id");
						var id_img_add_reponse = document.createAttribute("id");
						
						//AFFECTATION D UNE VALEUR AUX ATTRIBUTS
						id_reponse.value = "id_reponse";
						id_img_add_question.value = "img_btt_add_question";
						id_img_add_reponse.value = "btt_add_reponse_"+data;
						select_id.value = "answer_type";
						option.value = "short_answer";
						option.text = "Réponse courte";
						option2.value = "checkbox";
						option2.text = "Case à cocher";
						option3.value = "radio";
						option3.text = "Choix multiple";
						option4.value = "date";
						option4.text = "Date";
						
						div_reponse_id.value = "div_reponse_"+data;
						style_img_add_question.value = "width:20px;height:20px; position:absolute; left:200px; top:150px;"; 
						src_img_add_question.value = "/images/plus2.png";
						style_img_add_reponse.value = "width:20px;height:20px; position:absolute; right:200px; bottom:85px; "; 
						src_img_add_reponse.value = "/images/plus2.png";
				
						
						
						//INTEGRATION DES ATTRIBUT DANS LES ELEMENTS
						reponse.setAttributeNode(id_reponse);
						img_add_question.setAttributeNode(id_img_add_question);
						img_add_reponse.setAttributeNode(id_img_add_reponse);
						select.setAttributeNode(select_id);
						select.appendChild(option);
						select.appendChild(option2);
						select.appendChild(option3);
						select.appendChild(option4);
						div_reponse.setAttributeNode(div_reponse_id);  
						img_add_question.setAttributeNode(src_img_add_question);
						img_add_question.setAttributeNode(style_img_add_question);
						img_add_reponse.setAttributeNode(src_img_add_reponse);
						img_add_reponse.setAttributeNode(style_img_add_reponse);
						
						//INTEGRATION DES ELEMENTS DANS LA PAGE
						
						div_reponse.appendChild(select);
						div_reponse.appendChild(reponse);
						div_reponse.appendChild(select);
						div_reponse.appendChild(img_add_reponse);
						div_enquete.appendChild(div_reponse);
						div_enquete.appendChild(img_add_question);
						
						
						/*div_enquete.appendChild(h5);
						div_enquete.appendChild(reponse);
						div_enquete.appendChild(select);*/
						
						select.onchange = type_question;
						img_add_question.onclick = new_question;
						img_add_reponse.onclick = new_reponse;
		});
	}else{
				
			var recup_id_question = this.id;
			recup_id_question = recup_id_question.split("_");
			id_question = recup_id_question[1];
		
			id_enquete = document.getElementById("id_enquete").value;
			question = document.getElementById("titre_question").value;
				
			$.post( "./fct.asp", { fct: "maj_question", question: question, id_enquete: id_enquete, id_question: id_question, objet: "update"} ) 
			.done(function( data ) {
			var x = document.getElementById("titre_question");
			x.style.backgroundColor = '#ddffdd';
		});
	
	}
}

function type_question()
{
	var test = document.getElementById("answer_type").value;
	//alert(test);
	document.getElementById("reponse").type = test;
}

function new_question () 
{
		
	document.getElementById("img_btt_add_question").remove();
	var quest = document.createElement("input");
	var btt_add_question = document.createElement("input");
	var h5 = document.createElement("h5");	
				
				
				
	//CREATION D ATTRIBUTS
	var titre_question =  document.createAttribute("id");   
	var id_btt_question = document.createAttribute("id");
	var name_btt_question = document.createAttribute("name");
	var type =  document.createAttribute("type");   
	var value =  document.createAttribute("value");   
				
				
				
				
	//AFFECTATION D UNE VALEUR AUX ATTRIBUTS
	titre_question.value = "titre_question";
	quest.innerHTML = "Question";
	name_btt_question.value = "btt_add_question1";
	id_btt_question.value = "question_0";
	type.value = "button";
	value.value = "Valider";
				
				
				
	//INTEGRATION DES ATTRIBUT DANS LES ELEMENTS
	quest.setAttributeNode(titre_question);  
	btt_add_question.setAttributeNode(value); 
	btt_add_question.setAttributeNode(name_btt_question); 
	btt_add_question.setAttributeNode(id_btt_question);
	btt_add_question.setAttributeNode(type);  

	//INTEGRATION DES ELEMENTS DANS LA PAGE
	div_enquete.appendChild(quest);
	div_enquete.appendChild(btt_add_question);
	btt_add_question.onclick = add_question;
				
}
		
		
	function new_reponse () 
	{
		
		
		alert(this.id);
		
		
		
		//CREATION DES ELEMENTS HTML
		var reponse = document.createElement("input");
		var img_add_reponse = document.createElement("img");
				
						
		//CREATION D ATTRIBUTS
		var id_reponse = document.createAttribute("id");
		var style_img_add_reponse =  document.createAttribute("style");  
		var src_img_add_reponse = document.createAttribute("src");
						
						
		//AFFECTATION D UNE VALEUR AUX ATTRIBUTS
		id_reponse.value = "id_reponse";
		style_img_add_reponse.value = "width:20px;height:20px;"; 
		src_img_add_reponse.value = "/images/plus2.png";
				
						
						
		//INTEGRATION DES ATTRIBUT DANS LES ELEMENTS
		reponse.setAttributeNode(id_reponse);
		img_add_reponse.setAttributeNode(src_img_add_reponse);
		img_add_reponse.setAttributeNode(style_img_add_reponse);
						
		//INTEGRATION DES ELEMENTS DANS LA PAGE
		div_reponse.appendChild(img_add_reponse);
		div_reponse.appendChild(reponse);
		
		img_add_reponse.onclick = new_reponse;
				
	}


</script>

<body id="content">

<!--
<div id="add_enquete">
	<img class="add_enquete" src="images/add_enquete.png">
</div>
-->

<br/>
<div id="my_menu" class="vertical-menu">

 
<a href="javascript:void(0)" id= 'btn_menu' class="closebtn" onclick="closeNav() ">&times;</a>  <!--- appel à la fonction dans menu.js -->

<!-- javascript:void(0) permet de rafraichir la page à 0, a chaque fois que l'on executera une fonction -->

 <a href="#" class="active">Mes enquetes</a>
  <a href="#">Enquete 1</a>
  <a href="#">Enquete 2</a>
  <a href="#">Enquete 3</a>
  <a href="#">Enquete 4</a>
  <a href="#">Enquete 4</a>
  <a href="#">Enquete 4</a>
  <a href="#">Enquete 4</a>
  <a href="#">Enquete 4</a>
  <a href="#">Enquete 4</a>
  <a href="#">Enquete 4</a>
  <a href="#">Enquete 4</a>
  <a href="#">Enquete 4</a>
  <a href="#">Enquete 4</a>
</div>


<div id="hamburger" class="container" onclick="openNav();"><a href="#">Mes enquêtes</a> <!--- appel à la fonction dans menu.js -->
  <div class="bar1"></div>
  <div class="bar2"></div>  <!-- ICONE MENU (HAMBURGER)-->
  <div class="bar3"></div>
</div> 



<div id="bouton">
	<img id= "btt" class="plus" src="images/add_question.png" onclick="add_form(); zoom(); opacity(); ">

	<span id="titre_btt">
		<h4>Créer une enquete</h4>
	</span>

</div>



	
<div name="retour" id="retour" class="col-md-4"></div> 
<div name="retour2" id="retour2" class="col-md-12"></div> 

<br/><input id="cle" type="hidden" value="<%= Request.QueryString("id")%>" />
<a id="enquete"  name="enquete_lien" class="lien"></a><br/><div id="detail_enquete" class="detail_admin"></div>

<!--
<input type="submit" name="send" value="Envoyer">
-->

<div id="box-sizing">
<footer>
<p><a href="#">Back to top</a>
                Copyright Opcalia 2017 &copy; Tous droits r&eacute;serv&eacute;s. | <a  href="Mentions lÃ©gales.html">Mentions l&eacute;gales  </a> 
</p>
</footer>
</div>
</div>
</body>
</html>