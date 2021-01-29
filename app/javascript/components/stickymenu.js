const selectNav = () => { 
  // on cible l'objet nav
  let objNav = document.querySelector(".navmenu");
  // on mémorise la position de nav
  let memoPositionNav = objNav.offsetTop;

  function sticky(){
    // position du curseur au scroll
    let posCurseur = this.pageYOffset;
    console.log(memoPositionNav);
    console.log(posCurseur);
    // je teste la différence de distance entre le scroll et nav
    if(memoPositionNav-posCurseur<1){
      objNav.style.position = "fixed";
      objNav.style.top = 0;
      objNav.style.zIndex = 999;
      objNav.classList.add("active");
    }
    if(posCurseur<101){
      objNav.style.position = "";
      objNav.classList.remove("active");
    }
  }
  // evenement
  window.addEventListener("scroll", sticky);
}

// ()

export {selectNav};
  