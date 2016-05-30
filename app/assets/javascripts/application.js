//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .


// ugly!!! improve soon.
function reveal(default_non_show, default_show){
  default_non_show = document.getElementById(default_non_show).style;
  default_show = document.getElementById(default_show).style;
  
  if(default_non_show.display == 'none' ||default_non_show.display == ''){
    default_non_show.display = 'block';     
  }else{
    default_non_show.display = 'none';
  }
 
  if(default_show.display == 'block' ||default_show.display == ''){
    default_show.display = 'none';     
  }else{
    default_show.display = 'block';
  }
}