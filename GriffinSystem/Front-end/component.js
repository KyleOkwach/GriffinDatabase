//CUSTOM ELEMENTS
//navbar
class Navbar extends HTMLElement{
    connectedCallback(){
        this.innerHTML = `
        <nav>
            <div class="navbar">
                <div class="logo">
                    <a href="index.html">
                        <h1>GriffLib <i class="fa-brands fa-d-and-d"></i></h1>
                    </a>
                </div>
            </div>
        </nav>
        `
    }
}

//Footer
class Footer extends HTMLElement{
    connectedCallback(){
        this.innerHTML = `
        <footer>
            <div class="foot-content">
                <div class="credit">&copy;GriffinTechologies|2022</div>
            </div>
        </footer>
        `
    }
}

//Scroll to top
class Totop extends HTMLElement{
    connectedCallback(){
        this.innerHTML = `
            <div class="backtop">
                <button id="to_top" onclick="scroll_click('top')">
                    <i class="fa-solid fa-arrow-up"></i>
                </button>
            </div>
        `
    }
}

//Defined elements
customElements.define('page-navbar', Navbar);
customElements.define('page-footer', Footer)
customElements.define('page-top', Totop);