document.addEventListener("DOMContentLoaded", () => {
	
	//joinボタンの色変える
	let clickCount=0;
	const join=document.getElementById("join");
	
	changeJoin=function(){
		join.classList.toggle("btn-success");
		
		if(join.innerHTML==="Join"){
			join.innerHTML="Joined";
		}else{
			join.innerHTML="Join";
		}
		
		clickCount++;
		const isClick=clickCount%2===1;
		sendClickStatusToServer(isClick);
	}
	
	function sendClickStatusToServer(status){
		const xhr=new XMLHttpRequest();
		const url="JoinServet";
		
		xhr.open("POST",url,true);
		xhr.setRequestHeader("Content-Type","application/json");
		
		xhr.send(JSON.stringify({clickStatus:status}));
	}
	
	
	var test=none;
	test=window.sessionStorage.getItem([test]);
	console.log(test);
	
});