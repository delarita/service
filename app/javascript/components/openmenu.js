const openNav = () => {
   
    
    const button = document.querySelector(".menu-button");
    const openDiv = document.querySelector(".menu-mobile")
    const menuDiv = document.querySelector(".navmenu2")
  
    button.addEventListener("click", (event) => {
      
      openDiv.classList.toggle("active");
      menuDiv.classList.toggle("active");
      console.log(event)
  });
  
  };
  
  export { openNav };