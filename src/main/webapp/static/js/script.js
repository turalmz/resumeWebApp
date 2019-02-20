/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function openCity(evt, cityName) {
  // Declare all variables
  var i, tabcontent, tablinks;

  // Get all elements with class="tabcontent" and hide them
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }

  // Get all elements with class="tablinks" and remove the class "active"
  tablinks = document.getElementsByClassName("tablinks");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" active", "");
  }

  // Show the current tab, and add an "active" class to the button that opened the tab
  document.getElementById(cityName).style.display = "block";
  evt.currentTarget.className += " active";
}


$( document ).ready(function() {
    $('#datetimepicker1').datetimepicker({
        format: 'DD/MM/YYYY',
    });

    $('#datetimepicker2').datetimepicker({
        format: 'DD/MM/YYYY',
    });
    $('#datetimepicker3').datetimepicker({
        format: 'DD/MM/YYYY',
    });
});



document.getElementById("checkyear").value = "1";
alert(document.getElementById("checkyear").value);
