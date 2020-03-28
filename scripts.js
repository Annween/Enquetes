
$(document).ready(function () {

	$( "input:text" ).change(function() {
		sauv_value(this.id, $(this).val()	);
		
	});

	$( "input:checkbox" ).change(function() {
	//	alert ($(this).prop('checked') );	// Checkbox ou radio : true / false
		sauv_value(this.id, $(this).prop('checked')	);
	});

//	$( "input:radio" ).change(function() {
//			maj_enfant(this.id);
//		sauv_value(this.id, $(this).prop('checked')	);
//	});
	
	$( "input:radio" ).click(function() {
			maj_enfant(this.id);
/*	Dans la fonction maj_enfant pour traitement dans l'ordre			
				$("[name=enfant"+this.id+"]").prop("disabled", false);
				$("[name=enfantcache"+this.id+"]").show();
				$("[name=enfantcache"+this.id+"]").prop("disabled", false);
					$("[name=table_enfantcache"+this.id+"]").show();
					$("[name=enfantcache"+this.id+"]").css( 'background-color', '#5b9bd5' );
					$("[name=enfantcache"+this.id+"]").attr('checked', false); 

					
						// Traitement des petits enfants
					$("[name=enfantcache"+this.id+"]").each(function(){
						if ($(this).prop('checked')) {
						$("[name=enfantcache"+this.id+"]").show();
						$("[name=enfantcache"+this.id+"]").prop("disabled", false);
							$("[name=table_enfantcache"+this.id+"]").show();
							$("[name=enfantcache"+this.id+"]").css( 'background-color', '#5b9bd5' );
							$("[name=enfantcache"+this.id+"]").attr('checked', false); 
						}
					});
*/			
		
		sauv_value(this.id, $(this).prop('checked')	);
		
	});
	
	$( "textarea" ).change(function() {
	//	alert( $(this).val() );			// Textarea
		sauv_value(this.id, $(this).val()	);
	});
 
 
	$( "input[class='input_autre']" ).change(function() {

		if ($(this).prop('checked')) {
			$("[name=enfant"+this.id+"]").prop("disabled", false);
	//		$("[name=enfant"+this.id+"]").prop("placeholder", "Ecrivez votre réponse ici");
			
				$("[name=enfantcache"+this.id+"]").show();
				$("[name=enfantcache"+this.id+"]").prop("disabled", false);
	//			$("[name=enfantcache"+this.id+"]").prop("placeholder", "Ecrivez votre réponse ici");
		
						// Traitement des petits enfants
					$("[name=enfantcache"+this.id+"]").each(function(){
						if ($(this).prop('checked')) {
						$("[name=enfantcache"+this.id+"]").show();
						$("[name=enfantcache"+this.id+"]").prop("disabled", false);
						}
					});
		
		}
		else {
			$("[name=enfant"+this.id+"]").prop("disabled", true);
	//		$("[name=enfant"+this.id+"]").prop("placeholder", "");
				$("[name=enfant"+this.id+"]").val("");
				
				$("[name=enfantcache"+this.id+"]").hide();
				$("[name=enfantcache"+this.id+"]").val("");
				
				// Traitement des petits enfants
					$("[name=enfantcache"+this.id+"]").each(function(){
						$("[name=enfantcache"+this.id+"]").hide();
						$("[name=enfantcache"+this.id+"]").val("");
					});
				
		}
	});

	$( "input[class='input_ordre']" ).change(function() {
		if ($.isNumeric(this.value)== false) {
			alert("Vous devez indiquer un chiffre");
			$(this).val("");
		}
	});
	
	$( "#envoyer" ).click(function() {
		if (confirm("Attention, l'envoi du formulaire validera vos réponses, il ne vous sera plus possible de les modifier.\nVoulez-vous continuer ?")) {
		cloture_form();			
		}
		
	});
	
	
//	$( "input[class='radio_spe']" ).change( function(){
//		var jObjParent = $(this).parent();
//		$("[name="+this.name+"]").css( 'background-color', '#5b9bd5' );
//			jObjParent.css( 'background-color', '#70ad47' );
//	});

	$( "input[class='radio_spe']" ).click( function(){
		var jObjParent = $(this).parent();
		$("[name="+this.name+"]").css( 'background-color', '#5b9bd5' );
			jObjParent.css( 'background-color', '#70ad47' );
	});
	
	$( "div[class='div_radio_spe']" ).click( function(){
		var id = this.id.replace("div_radio_spe_","");
		$("#" + id)[0].click();
	});	
	
	
	$( "input[class='checkbox_spe']" ).click( function(){
		var jObjParent = $(this).parent();
		//alert(this.id);
		if($('#'+this.id).prop('checked') ){
			jObjParent.css( 'background-color', '#70ad47' );
		} else {
			jObjParent.css( 'background-color', '#5b9bd5' );
		}
	});
	
	$( "div[class='div_checkbox_spe']" ).click( function(){
		var id = this.id.replace("div_checkbox_spe_","");
		$("#" + id)[0].click();
	});	
 
 /*** Pages Admin ***/
	$( "#connecter" ).click(function() {
		admin_connexion();
	});	
 
 	$( "[name=enquete_lien" ).click(function() {
 	var cle = document.getElementById("cle").value;
		//affiche_detail(this.id);
		//export_resultat(this.id);
		$(location).attr('href',"https://enquetes.opcalia.com/admin_export.asp?id="+this.id+"&cle="+cle+"");
	});	
 
  });

  /*** Fonctions ***/
  	function maj_enfant(id) {
		var cle = document.getElementById("cle").value;
		var id;
		$.post( "fct.asp", { cle: cle, id: id, fct:"maj_enfant" } )
		
		.done(function( data ) {
		var id_parent = data.split('|');

			jQuery.each(id_parent, function(index, item) {
				$("[name=enfant"+this+"]").prop("disabled", true);
				$("[name=enfant"+this+"]").prop("placeholder", "");
				$("[name=enfant"+this+"]").val("");
				
				$("[name=enfantcache"+this+"]").hide();
					$("[name=enfantcache"+this+"]").val("");
				$("[name=table_enfantcache"+this+"]").hide();
				
				
			});
		
				// Traitement des enfants
				$("[name=enfant"+id+"]").prop("disabled", false);
				$("[name=enfantcache"+id+"]").show();
				$("[name=enfantcache"+id+"]").prop("disabled", false);
					$("[name=table_enfantcache"+id+"]").show();
					$("[name=enfantcache"+id+"]").css( 'background-color', '#5b9bd5' );
					$("[name=enfantcache"+id+"]").attr('checked', false); 
				
						// Traitement des petits enfants
					$("[name=enfantcache"+this.id+"]").each(function(){
						if ($(this).prop('checked')) {
						$("[name=enfantcache"+this.id+"]").show();
						$("[name=enfantcache"+this.id+"]").prop("disabled", false);
							$("[name=table_enfantcache"+this.id+"]").show();
							$("[name=enfantcache"+this.id+"]").css( 'background-color', '#5b9bd5' );
							$("[name=enfantcache"+this.id+"]").attr('checked', false); 
						}
					});
		});
		
	}
  
	function sauv_value(id, valeur) {
 	var cle = document.getElementById("cle").value;
		

//	var valeur;
  	$.post( "fct.asp", { cle: cle, id: id, valeur: valeur, fct:"sauv_chp" } )

	
	//if($('#'+id).hasClass('input_ordre')) //{
		.done(function( data ) {
		
		var id_input = data.split('|');
		if(data != "") {
			jQuery.each(id_input, function(index, item) {
				
			var id_enquete_questions_items = this;
			var retour;
				//alert(id_enquete_questions_items);
				$.post( "fct.asp", { cle: cle, id: id_enquete_questions_items, fct:"get_val" } 
//				var upd = $("[id="+this+"]").val();
				, function(retour) {
					retour = retour;
				}
				)
				.done(function(retour) {
	//			$("[id="+this+"]").val(retour);
				document.getElementById(id_enquete_questions_items).value = retour;
				});
			});
		}
		}
	//};
		);	

	}

	function cloture_form() {
 	var cle = document.getElementById("cle").value;
	var id;
	var valeur;
  	$.post( "fct.asp", { cle: cle, fct: "cloture_form" } )
		.done(function( data ) {
//		$("#retour").html(data);
		location.reload(true);
		});
	}

	function admin_connexion() {
 	var login = document.getElementById("login").value;
	var mdp = document.getElementById("mdp").value;
	$.post( "fct.asp", {login: login, mdp: mdp, fct: "admin_connexion" } )
		.done(function( data ) {
			if (data.match("^Erreur")) {
					$("#retour").html(data);
			}
			else {
					window.location.replace("admin_page.asp?id="+data);
			}
		});
	}

	function affiche_detail(id) {
 	var id;
 	var cle = document.getElementById("cle").value;
	$.post( "fct.asp", {id: id, cle: cle, fct: "affiche_detail" } )
		.done(function( data ) {
			$("#detail_enquete").html(data);
		});
	}
	
	function sauv(name, id, valeur) {
 	var name;
	var id;
	var valeur;
  	$.post( "fct.asp", { name : name, id: id, valeur: valeur, fct:"sauv" } );
	
	}


	
	