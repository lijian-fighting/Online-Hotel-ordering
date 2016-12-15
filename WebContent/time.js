function time(){
  var now= new Date(),
   year=now.getFullYear(),
   month=now.getMonth(),
   date=now.getDate(),
   hour=now.getHours(),
   minute=now.getMinutes(),
   second=now.getSeconds();
  document.getElementById("info1").innerHTML=year+"年"+(month+1)+"月"+date+"日"+hour+"时"+minute+"分"+second+"秒";
  setTimeout("time()",1000);
}
