


const selectNav = () => { 
  // on cible l'objet nav
  let objNav = document.querySelector(".navmenu");
  let contain = document.querySelector(".menu-container");
  let title = document.querySelector(".titre");
  let logoDiv = document.querySelector(".logo");
  let phone = document.querySelector(".phone-number")
  let callToAction = document.querySelector(".contact-banner")
  // on mémorise la position de nav
  if (objNav) {
  let memoPositionNav = objNav.offsetTop;
 
  function sticky(){
    // position du curseur au scroll
    let posCurseur = this.pageYOffset;
    // console.log(memoPositionNav, "before");
    // console.log(posCurseur);
    // je teste la différence de distance entre le scroll et nav
    if(memoPositionNav-posCurseur<1){
      objNav.style.position = "fixed";
      objNav.style.top = 0;
      objNav.style.zIndex = 999;
      objNav.classList.add("active");
      contain.classList.add("active");
      title.style.display ="none";
      logoDiv.style.display ="none";
      phone.style.display="none";
      callToAction.style.display="none";
    }
    if(posCurseur<101){
      objNav.style.position = "";
      objNav.classList.remove("active");
      contain.classList.remove("active");
      title.style.display ="";
      logoDiv.style.display ="";
      phone.style.display="";
      callToAction.style.display="";
    }
  }
  // evenement
  window.addEventListener("scroll", sticky);
}
}
// ()

export {selectNav};
  