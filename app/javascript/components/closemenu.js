const closeNav = () => {
   
    
    const closeButton = document.querySelector(".close-button");
    const openDiv = document.querySelector(".menu-mobile")
  
  
    closeButton.addEventListener("click", (event) => {
      
      openDiv.classList.remove("active");
      console.log(event)
  });
  
  };
  
  export { closeNav };