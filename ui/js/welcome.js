const welcomeContainer = document.querySelector("#welcome");

window.addEventListener("message", function(event) {
    console.log("Event de message sur le dom")
    let item = event.data
    if (item.type === "WelcomeUI") 
    {
        welcomeContainer.classList.remove("hidden");
        console.log("Je doit enlever Hidden du container welcome")
    }
})