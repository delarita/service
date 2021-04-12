const openNav = () => {


    const button = document.querySelector(".menu-button");
    const openDiv = document.querySelector(".menu-mobile")
    const menuDiv = document.querySelector(".navmenu2")

    button.addEventListener("click", (event) => {
      console.log(event)
      openDiv.classList.toggle("active");
      menuDiv.classList.toggle("active");
      button.classList.toggle("colorize")
    });
  };

  export { openNav };
