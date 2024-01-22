const bar1 = document.getElementById('bar');
const nav1 = document.getElementById("nav_bar");
const close1 = document.getElementById("nav_bar")
console.log(bar1);
if (bar1){
    bar1.addEventListener("click", ()=>{
       nav1.classList.add("active");
    });
}

if (close1){
    close1.addEventListener("click", ()=>{
        nav1.classList.remove("active");
    });
}


