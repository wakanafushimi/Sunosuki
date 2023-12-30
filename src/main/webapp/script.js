//-------------------peersページ-------------------------------
//idをふる
var openmodals = document.querySelectorAll(".openmodal");
var popups = document.querySelectorAll(".popup");
var cancels = document.querySelectorAll(".cancel");

//クリックしたらopen
for (let i = 0; i < openmodals.length; i++) {
	openmodals[i].addEventListener('click', createModalHandler(i));

}
function createModalHandler(index) {
	console.log("Clicked openmodal " + index);
	return function() {
		popups[index].style.display = 'block';
	};
}

//クリックしたらしまう
for (let i = 0; i < cancels.length; i++) {
	cancels[i].addEventListener('click', hidePopups(i));
}
function hidePopups(index) {
	return function() {
		popups[index].style.display = 'none';
	}
}


//-------------------sessionページ-------------------------------
var openmemberdetails = document.querySelectorAll(".openmemberdetail");
var memberdetailpopups = document.querySelectorAll(".memberdetailpopup");
var cancelmemberdetails = document.querySelectorAll(".cancelmemberdetail");
var memberdetaillists = document.querySelectorAll(".memberdetaillist");

//クリックしたらopen
for (let i = 0; i < openmemberdetails.length; i++) {
	openmemberdetails[i].addEventListener('click', openMemberdetail(i));

}
function openMemberdetail(index) {
	return function() {
		memberdetailpopups[index].style.display = 'block';

	};
}

//クリックしたらしまう
for (let i = 0; i < cancelmemberdetails.length; i++) {
	cancelmemberdetails[i].addEventListener('click', hideMemberpopups(i));
}
function hideMemberpopups(index) {
	return function() {
		memberdetailpopups[index].style.display = 'none';
	}
}


//-------------------deleteBtn------------------------------
const deleteBtn=document.getElementById("deleteBtn")
deleteBtn.addEventListener("click",()=>{
	alert("Are you sure you delete it?")
})

//-------------------都道府県-ゲレンデ-------------------------------
