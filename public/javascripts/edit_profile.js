function validateForm()
{
var x=document.forms["myForm"]["profile[name]"].value
if (x==null || x=="")
  {
  alert("First name must be filled out");
  return false;
  }
}