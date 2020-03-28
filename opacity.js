/* DOCUMENT JAVASCRIPT 

DESCRIPTION : 

Fonction opacity : permet de créer un fond opaque au clic d'un bouton.

Fonction zoom : permet d'agrandir la taille de notre encadré.

Fonction close_div : permet de fermer notre encadré et de revenir à la mise en page initiale.



*/



/* ---------------------------------------------------
                  1.  FOND 
----------------------------------------------------- */



function opacity() 
{
   var btt = document.getElementById('btt'); 
   document.body.style.backgroundColor = "rgba(0, 0, 0, 0.4)"; // couleur du fond du fond semi transparent
   document.getElementById("hamburger").style.display = "none"; // avec la propriété de style 'display : none;' on peut faire disparaître plusieurs élements afin d'éviter qu'il soit visible à travers le fond semi-transparent, pour plus d'esthétisme 
   document.getElementById("titre_btt").style.display = "none";
   document.getElementById("btt").style.display = "none";
   document.getElementById("cadre").style.display = "none";
   document.getElementById("box-sizing").style.display = "none";
 //  document.getElementById("div_btn").style.display = "block";
 
 /*
   if (btt.onlick = document.body.style.backgroundColor = "rgba(0, 0, 0, 0.5)") // si le fond possède la couleur "rgba(0, 0, 0, 0.5)" alors notre encadré sera opaque 
   {
     btt.onclick = document.getElementById("div_enquete").style.opacity = 1; // permet au bloc de rester opaque par rapport au fond 
   } 
*/	

  if (document.body.style.backgroundColor == "rgba(0, 0, 0, 0.5)") // si le fond possède la couleur "rgba(0, 0, 0, 0.5)" alors notre encadré sera opaque 
   {
     document.getElementById("div_enquete").style.opacity = 1; // permet au bloc de rester opaque par rapport au fond 
   } 

//alert("opacity");
}

/* ---------------------------------------------------
                  2. AGRANDISSEMENT  
----------------------------------------------------- */


function zoom () 
{
	//alert("zoom");
	document.getElementById('div_enquete').style.transform = 'scale(1.25)'; // taille du bloc 
}



/* ---------------------------------------------------
                  3. FERMETURE  
----------------------------------------------------- */


$(document).click(function(evt){
 
	var target = evt.target, prevent = false;
 
	while( target && !prevent ){
		// id des éléments qui ne déclenche pas la fermeture
		if( target.id == "div_enquete" || target.id == "btt" )
			prevent = true;
		target = target.parentNode;
	}
 
	// si le clique n'était pas sur un élémént de la recherhe, on cache l'élément
	if( !prevent ){
	//	document.getElementById('div_enquete').style.display='none';
		document.body.removeChild(document.getElementById('div_enquete'));
        document.getElementById("hamburger").style.display = "block";
        document.getElementById("hamburger").style.margin = "6px 0";
        document.getElementById("titre_btt").style.display = "block";
        document.getElementById("titre_btt").style.top = "200px"; // on replace certain éléments, car le script, ne garde pas en mémoire la position précédente de ceux-ci
        document.getElementById("titre_btt").style.left = "90px";
        document.getElementById("btt").style.display = "block";
        document.getElementById("cadre").style.display = "block";
        document.getElementById("box-sizing").style.display = "block";
        document.body.style.backgroundColor = "initial"; // permet de revenir à la couleur de fond initiale 



	}
 
	// ne stop pas la propagation
	return true;
});