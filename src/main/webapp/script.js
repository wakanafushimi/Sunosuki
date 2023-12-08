document.addEventListener("DOMContentLoaded", () => {
	console.log("DOMContentLoaded event fired");
	
		var modals=document.querySelectorAll(".modal");
		var openmodals=document.querySelectorAll(".openmodal");
		for(let i=0;i<openmodals.length;i++){
			openmodals[i].addEventListener('click',createModalHandler(i));
		}
		function createModalHandler(index){
			console.log("Clicked openmodal " + index);
			return function(){
				modals[index].style.display='block';
			};
		}
		
		for(var i=0; i<modals.length;i++){
			modals[i].addEventListener('click',function(){
				this.style.display='none';
			});
		}

});