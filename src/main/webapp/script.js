document.addEventListener("DOMContentLoaded", () => {
	console.log("DOMContentLoaded event fired");
	
		//idをふる
		var modals=document.querySelectorAll(".popup");
		var openmodals=document.querySelectorAll(".openmodal");
		for(let i=0;i<openmodals.length;i++){
			openmodals[i].addEventListener('click',createModalHandler(i));
			
		}
		
		
		//クリックしたらopen
		function createModalHandler(index){
			console.log("Clicked openmodal " + index);
			return function(){
				modals[index].style.display='block';
			};
		}
		
		//クリックしたらしまう
		for(var i=0; i<modals.length;i++){
			modals[i].addEventListener('click',function(){
				this.style.display='none';
			});
		}
	
	

});
