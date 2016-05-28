//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .


function reveal(ger, eng){
  // this is damn ugly. find better way if time.
  ger = document.getElementById(ger).style;
  eng = document.getElementById(eng).style;
  
  if(ger.display == 'none' || ger.display == ''){
    ger.display = 'block';     
  }else{
    ger.display = 'none';
  }
 
  if(eng.display == 'block' || eng.display == ''){
    eng.display = 'none';     
  }else{
    eng.display = 'block';
  }
}