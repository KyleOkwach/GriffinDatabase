pass_show();

function scroll_click(block){
    /*scrolls to specified section of page
    'block' is the section to scroll to and it's an id*/
    document.getElementById(block).scrollIntoView();
}

function change_page(page){
    window.location.href = page; 
    //window.location.replace(page) works but it removes the previous page from history
}

function pass_show(){
    //toggles show password
    const toggle = document.querySelector(".toggle"),
        input = document.querySelector("input");

        toggle.addEventListener("click", () =>{
            if(input.type === "password"){
                input.type = "text";
                toggle.classList.replace("fa-eye-slash", "fa-eye");
            }else{
                input.type = "password";
                toggle.classList.replace("fa-eye", "fa-eye-slash");
            }
        });
}