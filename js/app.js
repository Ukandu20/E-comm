const typeClass = document.querySelector(".type");

const words = ["Online Shopping","High Quality","World Wide Shipping"];

let count = 0;

let Counter = 0;

function type(){
    if(count === words.length){
        count = 0;
    } 
    let currentWords = words[count];
    let letters = currentWords.slice(0,++Counter);
    typeClass.textContent = letters;

    if(letters.length === currentWords.length){
        Counter = 0;
        count++;
    }
    setTimeout(type,200);
}  
  type();
