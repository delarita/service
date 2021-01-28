const openNav = () => {
   
    
    const button = document.querySelector(".menu-button");
    const openDiv = document.querySelector(".menu-mobile")
  
  
    button.addEventListener("click", (event) => {
      
      openDiv.classList.add("active");
      console.log(event)
  });
  
  };
  
  export { openNav };