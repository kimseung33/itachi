function checkImageType(fileName) {
	var pattern=/jpg|gif|png|jpeg/i;
	return fileName.match(pattern);
	
}
/*function getFileInfo(data) {
	var imgsrc, getLink, fileName, fullName;
	fullName=data;
	
	if(checkImageType(data)){
		imgsrc="/displayfile?fileName="+data;
		var prefix=data.substr(0, 12);
		var suffix=data.substr(14);
		getLink="/displayfile?fileName="+(prefix+suffix);
		var idx=data.indexOf("_",14);
		fileName=data.substring(idx+1);
	}else{
		imgsrc="/resources/img/gagi.jpg";
		getLink="/displayfile?fileName="+data;
		var idx=data.indexOf("_");
		fileName=data.substring(idx+1);
	}
	return {imgsrc:imgsrc, getLink:getLink, fileName:fileName,fullName:fullName};
	
}*/


function getFileInfo(data){
	   var imgsrc, getLink, fileName, fullName,target;
	   fullName = data;
	   
	   if(checkImageType(data)){
	      imgsrc="/displayfile?fileName=" + data;

	      var prefix = data.substring(0, 12);
	      var suffix = data.substring(14);
	      
	      getLink = "/displayfile?fileName=" + (prefix+suffix);
	      
	      var idx = data.indexOf("_", 14)+1;
	      fileName = data.substring(idx);
	      target="_blank";
	   } else {
	      imgsrc = "/resources/img/gagi.jpg";
	      getLink = "/displayfile?fileName=" + data;
	      var idx = data.indexOf("_")+1;
	      fileName = data.substring(idx);
	   }
	   
	   return {imgsrc:imgsrc, getLink:getLink, fileName:fileName, fullName:fullName,target:target};
	}