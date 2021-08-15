<script type="text/javascript">

function email_change(){
 if(document.join.email.options[document.join.email.selectedIndex].value == '0'){
  document.join.email2.disabled = true;
  document.join.email2.value = "";
 }
 if(document.join.email.options[document.join.email.selectedIndex].value == '9'){
  document.join.email2.disabled = false;
  document.join.email2.value = "";
  document.join.email2.focus();
 } else{
   document.join.email2.disabled = true;
   document.join.email2.value = document.join.email.options[document.join.email.selectedIndex].value;
  }
}
 
</script>
<form name="join">      
<input type="text" name="email1" value="이메일" onfocus="this.value='';">   @
<input type="text" name="email2" value="" disabled >
<select name="email" onchange="email_change()">
    <option value="0" >선택하세요</option>
    <option value="9">직접입력</option>
    <option value="naver.com">naver.com</option>
    <option value="nate.com">nate.com</option> 
   </select>
</form>
