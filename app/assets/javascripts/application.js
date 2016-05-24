//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .


function reveal(ger, eng){
  // normally applicaiton of block here to avoid repetition, if time, find easiest way to do it in js.
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

/* coffee version of function. 
reveal = (ger, eng) ->
  # normally applicaiton of block here to avoid repetition, if time, find easiest way to do it in js.
  ger = document.getElementById(ger).style
  eng = document.getElementById(eng).style
  if ger.display == 'none' or ger.display == ''
    ger.display = 'block'
  else
    ger.display = 'none'
  if eng.display == 'block' or eng.display == ''
    eng.display = 'none'
  else
    eng.display = 'block'
  return
*/
