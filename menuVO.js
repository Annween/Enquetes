/* DOCUMENT JAVASCRIPT

ESPACE ENQUETE OPCALIA

DESCRIPTION : Ce programme a pour fonction d'ouvrir et de fermer un menu tout en adaptant le contenu de la page (RESPONSIVE) à la taille que prendra le menu sur la page, 
mais aussi de faire disparaître et réaparaître une icone selon la fonction utilisée.


*/ 


/* ---------------------------------------------------
              1.OUVERTURE DU MENU
----------------------------------------------------- */
function openNav() 
{ 
  document.getElementById("my_menu").style.width = "250px"; /* on affecte une propriéte de style à la valeur "my_menu" celle-ci va permettre au menu d'apparaitre avec une largeur de 250 pixels*/ 
  document.getElementById("main").style.marginLeft = "250px"; /* le contenu de la page ("main") va se décaler avec une marge de 250 pixels pour adapter la forme du contenu quand le menu apparaitra*/ 
  var menu = document.getElementById("hamburger");/* hamburger prend la valeur menu, pour plus de simplicité, ici on agit que sur l'icone du menu*/ 
  menu.style.display = 'none'; /* on affecte à 'menu' la propriété de style 'display:none;' qui permet de le faire disparaitre une fois qu'on ouvre le menu (en cliquant sur l'icone) */ 
  document.getElementById("titre_btt").style.display = "none"; 
  document.getElementById("btt").style.display = "none";

}


/* ---------------------------------------------------
              2.FERMETURE DU MENU
----------------------------------------------------- */
function closeNav() 
{ 
  document.getElementById("my_menu").style.width = "0"; /* my_menu prend la valeur largeur =  0 */ 
  document.getElementById("main").style.marginLeft = "0"; /* le contenu de la page inséré dans "main" reprend sa forme initiale*/ 
  var menu = document.getElementById("hamburger"); /* hamburger prend la valeur menu, pour plus de simplicité, ici on agit essentiellement sur l'icone du menu*/ 
  

  if (menu.style.display == 'none') /* Si notre menu est invisible('display:none;') alors on le fait apparaitre avec la propriéte de style "display: block;"*/ 
  {
   menu.style.display='block';
   menu.style.margin="6px 0"; /* il faut replacer l'icone car après l'animation, l'icone ne garde pas en mémoire les propriétés de styles établie auparavant */ 
   document.getElementById("titre_btt").style.display = "block"; 
   document.getElementById("btt").style.display = "block";
   document.getElementById("titre_btt").style.top = "200px"; // on replace certain éléments, car le script, ne garde pas en mémoire la position précédente de ceux-ci
   document.getElementById("titre_btt").style.left = "90px";
  }

} 

