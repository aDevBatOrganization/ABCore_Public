const welcomeContainer = document.querySelector("#welcome");
let userInfos = "";

window.addEventListener("message", function(event) {
    let item = event.data
    if (item.type === "WelcomeUI") 
    {
        welcomeContainer.classList.remove("hidden");
        userInfos = item.userInfos
    }
    else if (item.type === "notification") 
    {
        console.log('event notification')
        const notifContainer = document.getElementById('notification')
        const notifParagraphe = document.getElementById('notification-container')
        notifContainer.classList.remove("hidden");
        notifParagraphe.innerHTML = item.text;

        this.setTimeout(function() {
            notifContainer.classList.add("hidden")
        }, item.duration)
    }
})

let submit = false

window.addEventListener("click", (e) => {
    const identityForm = document.querySelector('#identityForm');
    identityForm.addEventListener("submit", (e) => {
        welcomeContainer.classList.add("hidden")

        if (submit == true) {
            e.preventDefault();
            return;
        }
        submit = true

        const firstname = identityForm.elements['firstname'].value 
        const lastname = identityForm.elements['lastname'].value 
        const birthday = identityForm.elements['birthday'].value 
        const height = identityForm.elements['height'].value 
        
        let sex; 
        const homme = identityForm.elements['sex'].checked
        const femme = identityForm.elements['sex-femme'].checked

        if (homme) {
            sex = 0
        } else if (femme) {
            sex = 1
        } else {
            sex = 0
        }

        if (submit == true) {
            fetch(`https://${GetParentResourceName()}/registerIdentity`, {
                method: "POST",
                headers: {
                    "Content-Type" : "applications/json; charset=UTF-8",
                },
                body: JSON.stringify({
                    firstname:firstname,
                    lastname:lastname,
                    birthday:birthday,
                    height:height,
                    sex:sex,
                    userInfos: userInfos,
                }),
            });
            submit = false
        }
    })
})

const openURL = (url) => {
    window.invokeNative("openURL", url);
}
